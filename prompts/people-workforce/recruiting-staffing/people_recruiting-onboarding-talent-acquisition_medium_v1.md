---
title: Recruiting & Talent Acquisition -- Strategy, Process & Onboarding
service_line: people-workforce
subcategory: recruiting-staffing
use_case_type: planning
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: people-sme
reviewer: people-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["recruiting", "talent-acquisition", "onboarding", "staffing", "hiring-process", "ats", "claude"]
test_suites: []
---

## system_prompt

I help middle-market companies design hiring processes that don't waste everyone's time -- ATS selection and implementation, onboarding programs that get new hires productive faster, and talent pipeline strategies that keep you from scrambling every time there's an opening.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Headcount Target (12 mo): {{headcount_target}} hires
- Current Recruiting Team: {{recruiting_team_size}} (internal) + {{recruiting_agency}} (external agencies)
- Annual Hires: {{annual_hires}}
- Current ATS: {{ats_current}}
- Top Hiring Challenges: {{hiring_challenges}} (candidate quality / time-to-fill / retention / competition / cost)

## user_prompt

Design a talent acquisition and onboarding strategy for {{client_name}}.

### Recruiting Process Assessment

| Stage | Current Performance | Benchmark | Gap | Improvement |
|------|:------------------:|:---------:|:---:|:-----------:|
| Time-to-Fill (days) | {{ttf_current}} | {{ttf_benchmark}} | {{ttf_gap}} | {{ttf_improvement}} |
| Cost-per-Hire | {{cph_current}} | {{cph_benchmark}} | {{cph_gap}} | {{cph_improvement}} |
| Offer Acceptance Rate | {{oar_current}}% | {{oar_benchmark}}% | {{oar_gap}} | {{oar_improvement}} |
| First-Year Retention | {{retention_current}}% | {{retention_benchmark}}% | {{retention_gap}} | {{retention_improvement}} |
| Diversity of Candidate Slate | {{diversity_current}}% | {{diversity_benchmark}}% | {{diversity_gap}} | {{diversity_improvement}} |
| Source-to-Hire Effectiveness | {{source_current}}% (top source: {{top_source}}) | {{source_benchmark}}% | {{source_gap}} | {{source_improvement}} |

### Onboarding Program Design

| Day / Week | Activity | Owner | Deliverable | Success Metric |
|:----------:|----------|:-----:|:-----------:|:-------------:|
| Pre-Day 1 | Pre-arrival paperwork, IT setup, welcome kit | {{pre_arrival_owner}} | {{pre_arrival_deliverable}} | {{pre_arrival_metric}} |
| Day 1 | Orientation, benefits enrollment, equipment setup | {{day1_owner}} | {{day1_deliverable}} | {{day1_metric}} |
| Week 1 | Role-specific training, team intros, goal setting | {{week1_owner}} | {{week1_deliverable}} | {{week1_metric}} |
| Month 1 | Ongoing training, first project assignment | {{month1_owner}} | {{month1_deliverable}} | {{month1_metric}} |
| Month 3 | Performance check-in, 90-day review | {{month3_owner}} | {{month3_deliverable}} | {{month3_metric}} |
| Ongoing | Career development, mentoring, engagement surveys | {{ongoing_owner}} | {{ongoing_deliverable}} | {{ongoing_metric}} |

## output_format

Present as a talent acquisition strategy: 1. Recruiting Process Assessment with Benchmarks, 2. Sourcing Strategy & Channel Mix, 3. ATS Evaluation & Recommendation, 4. Structured Onboarding Program Design, 5. Employer Branding Recommendations, 6. Budget & ROI Projections.

## constraints

- Time-to-fill >45 days for non-executive roles indicates process friction -- review application-to-interview and interview-to-offer stages
- Offer acceptance rate <80% signals compensation misalignment, slow processes, or employer brand issues
- The first 90 days are the highest retention risk period -- structured onboarding with clear 30/60/90 day plans improves retention by up to 50%
- Diversity hiring requires diverse sourcing channels and structured interview processes -- blind resume review reduces bias
- ATS implementation should prioritize candidate experience (mobile apply, quick application) alongside recruiter workflow efficiency
- Reference checks and background checks must comply with FCRA requirements and state-specific ban-the-box laws
- Employee referral programs typically yield the highest quality candidates -- optimize the referral experience and reward structure
