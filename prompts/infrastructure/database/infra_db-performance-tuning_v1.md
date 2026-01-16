---
title: Database Performance Tuning & Query Optimization
service_line: infrastructure
subcategory: database
use_case_type: optimization
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: dba-lead
created_date: 2026-04-22
last_modified: 2026-06-13
tags: ["database", "sql", "performance", "optimization", "rds", "aurora", "azure-sql", "claude"]
test_suites: ["testing/test-cases/infrastructure/db-tuning.json"]
---

## system_prompt

I've managed 200+ production databases across AWS (RDS, Aurora, DynamoDB, ElastiCache) and Azure (Azure SQL, Cosmos DB, Redis Cache). The most common performance problems aren't about hardware -- they're about bad queries, missing indexes, and connection management. I've seen the same patterns repeat across every platform.

## context

**Database Details:**
- Database Type: {{db_type}} (PostgreSQL / MySQL / SQL Server / Aurora / DynamoDB / Cosmos DB)
- Engine Version: {{engine_version}}
- Instance Class: {{instance_class}}
- Storage: {{storage_type}} {{storage_size}} GB ({{storage_iops}} IOPS provisioned)
- Environment: {{environment}}
- Region: {{region}}

**Performance Issue:**
- Symptom: {{symptom}} (slow queries / high CPU / connection storms / replication lag / deadlocks / timeout)
- Avg Query Latency: {{avg_latency}}ms (baseline: {{baseline_latency}}ms)
- Connections: {{active_connections}} / {{max_connections}}
- CPU: {{cpu_usage}}%
- Memory: {{memory_usage}}%
- IOPS: {{iops_usage}} / {{iops_provisioned}}
- Slow Query Log Snippet:
  ```sql
  {{slow_query_log}}
  ```

## user_prompt

I'm a junior engineer investigating database performance issues. Guide me through diagnosis and optimization.

### Phase 1: Identify the Bottleneck

Walk me through checking each resource to identify where the bottleneck is:

**1. CPU Bottleneck**
```sql
-- Check if CPU is the bottleneck
-- PostgreSQL:
SELECT pid, now() - pg_stat_activity.query_start AS duration, query, state
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY duration DESC LIMIT 10;

-- MySQL:
SHOW FULL PROCESSLIST;
SELECT * FROM sys.processlist WHERE conn_id > 0 ORDER BY time DESC;

-- SQL Server:
SELECT r.session_id, r.cpu_time, r.total_elapsed_time, t.text
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
ORDER BY r.cpu_time DESC;
```
- What does high CPU with few active queries indicate?
- What does high CPU with many active queries indicate?

**2. I/O Bottleneck**
```sql
-- Check I/O wait and disk queue
-- PostgreSQL:
SELECT schemaname, tablename, seq_scan, seq_tup_read, idx_scan, idx_tup_fetch
FROM pg_stat_user_tables
ORDER BY seq_scan DESC LIMIT 10;

-- MySQL:
SHOW ENGINE INNODB STATUS\G
-- Look for "I/O thread" and "Pending reads/writes" sections

-- Check Read/Write latency from CloudWatch / Azure Monitor
```
- What does high read IOPS with sequential scans suggest?
- What does high write IOPS suggest?

**3. Memory / Buffer Cache**
```sql
-- Check cache hit ratio
-- PostgreSQL:
SELECT
  'index hit rate' AS name,
  (sum(idx_blks_hit)) / nullif(sum(idx_blks_hit + idx_blks_read),0) AS ratio
FROM pg_statio_user_indexes
UNION ALL
SELECT
 'table hit rate',
 sum(heap_blks_hit) / nullif(sum(heap_blks_hit + heap_blks_read),0)
FROM pg_statio_user_tables;

-- SQL Server:
SELECT
  (1 - (SUM(page_io_wait_ms) / (SUM(page_io_wait_ms) + SUM(page_io_miss_ms)))) * 100 AS cache_hit_ratio
FROM sys.dm_os_performance_counters
WHERE counter_name LIKE 'Page lookups/sec%';
```
- Cache hit ratio < 99% suggests insufficient memory or missing indexes

**4. Connection Pool Saturation**
```sql
-- PostgreSQL:
SELECT count(*) as active_connections, max_connections
FROM pg_stat_activity, (SELECT setting::int AS max_connections FROM pg_settings WHERE name = 'max_connections') settings;

-- Check if connections are idle in transaction vs active
SELECT state, count(*) FROM pg_stat_activity GROUP BY state;
```
- Too many idle-in-transaction connections suggest application-side connection leak

### Phase 2: Slow Query Analysis

Provide the full workflow for identifying and fixing slow queries:

```sql
-- Enable slow query log (check if already enabled)
-- PostgreSQL:
LOAD 'auto_explain';
SET auto_explain.log_min_duration = '{{slow_query_threshold_ms}}ms';
SET auto_explain.log_analyze = on;

-- MySQL:
SET GLOBAL slow_query_log = ON;
SET GLOBAL long_query_time = {{slow_query_threshold_seconds}};
SET GLOBAL log_queries_not_using_indexes = ON;
```

For a given slow query, walk through:
1. **Get the execution plan:**
   ```sql
   EXPLAIN (ANALYZE, BUFFERS, FORMAT JSON) {{slow_query}};
   ```
2. **Interpret the plan:**
   - Sequential scan on large table → missing index
   - Nested loop join on large datasets → should be hash join (check work_mem)
   - Sort on disk → sort memory too low
   - Index scan with high filter ratio → wrong index or missing composite index
3. **Index recommendations:**
   ```sql
   CREATE INDEX CONCURRENTLY idx_{{table}}_{{column}}
   ON {{table}} ({{column}})
   WHERE {{condition}};  -- partial index if applicable
   ```

### Phase 3: Common Optimization Patterns

**Pattern 1: Missing Index**
- Before: query takes {{before_time}}ms with seq scan on {{table}} ({{row_count}} rows)
- After: query takes {{after_time}}ms with index scan
- Exact index to create:
  ```sql
  CREATE INDEX CONCURRENTLY idx_{{table}}_{{columns}}
  ON {{table}} ({{column1}}, {{column2}})
  INCLUDE ({{covering_columns}});
  ```

**Pattern 2: N+1 Query Problem**
- Problem: Application makes N+1 database calls in a loop
- Detection: `pg_stat_statements` shows same query with different ID values
- Fix: Use JOIN or batch loading
  ```sql
  -- Instead of N queries:
  SELECT * FROM orders WHERE user_id = 1;
  SELECT * FROM orders WHERE user_id = 2;
  -- Use 1 query:
  SELECT * FROM orders WHERE user_id IN (1, 2, ...);
  ```

**Pattern 3: Bloat / MVCC (PostgreSQL-specific)**
- Check table bloat:
  ```sql
  SELECT schemaname, tablename, n_dead_tup, n_live_tup,
    round(n_dead_tup * 100.0 / nullif(n_live_tup, 0), 2) AS dead_pct
  FROM pg_stat_user_tables
  ORDER BY dead_pct DESC LIMIT 10;
  ```
- VACUUM recommendation:
  ```sql
  VACUUM (VERBOSE, ANALYZE) {{table_name}};
  -- If bloat > 20%, consider VACUUM FULL (takes table lock)
  ```

**Pattern 4: Connection Storm**
- Config changes to mitigate:
  ```sql
  -- PostgreSQL: Connection pooling with PgBouncer
  -- Application-side: connection pool limits (HikariCP, etc.)
  ```
- Immediate mitigation: Terminate idle connections
  ```sql
  SELECT pg_terminate_backend(pid)
  FROM pg_stat_activity
  WHERE state = 'idle'
  AND state_change < now() - interval '30 minutes';
  ```

### Phase 4: Query Rewrite Recommendations

For each slow query found in the log:

1. **Original query:**
   ```sql
   {{original_query}}
   ```
2. **Execution plan analysis:**
   {{plan_analysis}}
3. **Rewritten query:**
   ```sql
   {{optimized_query}}
   ```
4. **Expected improvement:** {{expected_improvement}}% reduction in execution time

## output_format

Present the diagnosis as:
1. **Bottleneck Identification** -- CPU / I/O / Memory / Connections with evidence
2. **Top 5 Slow Queries** -- ranked by total impact (frequency × duration)
3. **Quick Wins** -- fixes that take < 30 minutes (missing index, config tuning)
4. **Structural Fixes** -- changes requiring review and testing (query rewrite, schema change)
5. **Monitoring Recommendations** -- additional metrics or alerts to prevent recurrence

## constraints

- Never recommend `VACUUM FULL` on a production database without a maintenance window
- Index creation on production tables should use `CONCURRENTLY` (PostgreSQL) or `ONLINE` (SQL Server)
- Always estimate index size before creating: `SELECT relpages * 8192 AS index_size FROM pg_class WHERE relname = 'index_name'`
- Connection pool settings must match application limits -- don't exceed `max_connections`
