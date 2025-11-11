---
title: Cost Segregation Study -- Engineering-Based Asset Classification
service_line: tax
subcategory: credits-incentives
use_case_type: analysis
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: tax-sme
reviewer: tax-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["cost-segregation", "cost-recovery", "depreciation", "macrs", "bonus-depreciation", "irc-179", "engineering", "claude"]
test_suites: []
---

## system_prompt

I'm a . You apply IRS Cost Segregation Audit Techniques Guide (ATG), Rev. Proc. 87-56, and relevant case law to classify building components into 5-year, 7-year, 15-year, and 39-year recovery periods.

Your methodology:
1. **Plans & Specs Review** -- analyze architectural/engineering drawings
2. **Site Visit & Physical Observation** -- verify as-built conditions
3. **Cost Allocation** -- disaggregate total construction cost by building system
4. **Engineering Classification** -- apply tax law to classify each component
5. **Depreciation Calculation** -- compute NPV benefit of reclassification

## context

**Property:**
- Property Name: {{property_name}}
- Address: {{property_address}}
- Property Type: {{property_type}} (commercial office / retail / manufacturing / healthcare / multifamily / hotel / warehouse / mixed-use)
- Acquisition Date: {{acquisition_date}}
- Placed-in-Service Date: {{placed_in_service_date}}
- Cost Basis: {{cost_basis}} (total acquisition/construction cost)
- Land Value (excluded): {{land_value}}
- Building Cost: {{building_cost}}
- Personal Property / Land Improvements: {{personal_property_cost}} (if known)

**Construction Method:** {{construction_method}} (new construction / acquisition / renovation / tenant improvement / leasehold improvement)

## user_prompt

Perform a cost segregation study and asset classification analysis for {{property_name}}.

### Step 1: Building Systems Decomposition

Decompose the building into its primary systems using cost-estimating relationships (if detailed cost data unavailable) or contractor cost breakdowns:

| CSI MasterFormat Division | Description | Total Cost | % of Building | Tag |
|--------------------------|-------------|------------|---------------|-----|
| 03 -- Concrete | Foundations, slabs, columns, stairs | {{cost_concrete}} | {{pct_concrete}}% | |
| 04 -- Masonry | Block, brick, stone veneer | {{cost_masonry}} | {{pct_masonry}}% | |
| 05 -- Metals | Structural steel, decking, joists | {{cost_metals}} | {{pct_metals}}% | |
| 06 -- Wood/Plastics/Composites | Framing, millwork, casework | {{cost_wood}} | {{pct_wood}}% | |
| 08 -- Openings | Doors, windows, hardware, storefront | {{cost_openings}} | {{pct_openings}}% | |
| 09 -- Finishes | Drywall, flooring, ceiling, paint | {{cost_finishes}} | {{pct_finishes}}% | |
| 10 -- Specialties | Toilet partitions, lockers, signage | {{cost_specialties}} | {{pct_specialties}}% | |
| 11 -- Equipment | Kitchen, lab, medical equipment | {{cost_equipment}} | {{pct_equipment}}% | |
| 12 -- Furnishings | Window treatments, furniture, art | {{cost_furnishings}} | {{pct_furnishings}}% | |
| 22 -- Plumbing | Water, waste, gas piping, fixtures | {{cost_plumbing}} | {{pct_plumbing}}% | |
| 23 -- HVAC | Equipment, ductwork, controls, BMS | {{cost_hvac}} | {{pct_hvac}}% | |
| 25 -- BAS/BMS | Building automation system | {{cost_bas}} | {{pct_bas}}% | |
| 26 -- Electrical | Switchgear, panels, wiring, lighting | {{cost_electrical}} | {{pct_electrical}}% | |
| 27 -- Communications | Data cabling, voice, network | {{cost_communications}} | {{pct_communications}}% | |
| 28 -- Security/Access | Cameras, badging, alarms | {{cost_security}} | {{pct_security}}% | |
| 31 -- Site Work | Excavation, grading, utilities | {{cost_sitework}} | {{pct_sitework}}% | |
| 32 -- Exterior Improvements | Paving, curbs, landscaping, fencing | {{cost_exterior}} | {{pct_exterior}}% | |
| 33 -- Utilities | Power, water, sewer connection | {{cost_utilities}} | {{pct_utilities}}% | |

### Step 2: Engineering Classification by MACRS Recovery Period

**5-Year Property (MACRS 200% DB):** Tangible personal property that is not an integral part of the building structure.

Identify and reclassify:
| Component | Cost | Rationale for 5-Year Classification | Legal Authority |
|-----------|------|-------------------------------------|-----------------|
| Specialized lighting (e.g., track, accent) | {{cost_track_lighting}} | Not inherent to building function; decorative | Rev. Rul. 87-56, Asset Class 57.0 |
| Kitchen equipment | {{cost_kitchen_equipment}} | Food service equipment, not structural | Rev. Proc. 87-56, Asset Class 57.0 |
| Laboratory equipment | {{cost_lab_equipment}} | Scientific apparatus, not structural | Rev. Rul. 81-239 |
| Medical equipment (dental X-ray, MRI) | {{cost_medical}} | Specialized medical equipment | Asset Class 57.0 |
| Office furniture & cubicles | {{cost_furniture}} | Freestanding, not permanently attached | Rev. Proc. 87-56, Asset Class 57.0 |
| Computer equipment (servers, workstations) | {{cost_computers}} | Actual computers | 3- or 5-year per Rev. Proc. 87-56 |
| Data cabling (Cat6, fiber) | {{cost_cabling}} | Communication wiring | PLR 9740001, 2013 IRS CCA |
| Security cameras / access control | {{cost_security_equipment}} | Electronic surveillance | Rev. Rul. 67-394 |
| Decorative millwork & trim | {{cost_decorative_millwork}} | Aesthetic, not structural; removable | Hospital Corp. v. Comm., 109 TC 21 |
| Window treatments & blinds | {{cost_blinds}} | Not building component | Rev. Rul. 69-558 |
| Floor coverings (carpet, tile) -- specific types | {{cost_flooring_5yr}} | If modular or not permanent | See ATG discussion |
| Signage (interior & exterior) | {{cost_signage}} | Personal property | Rev. Rul. 88-62 |
| Wall coverings & paneling (non-load-bearing) | {{cost_wall_coverings}} | Decorative only | CCA 199921045 |

**7-Year Property (MACRS 200% DB):** Typically office furniture and fixtures not meeting 5-year criteria. Also applies to non-specialized single-purpose property.

| Component | Cost | Rationale |
|-----------|------|-----------|
| Office furniture (systems furniture) | {{cost_systems_furniture}} | If not qualifying under 5-year analysis |
| Landscaping (ornamental) | {{cost_ornamental_landscaping}} | Rev. Rul. 74-253 |

**15-Year Property (MACRS 150% DB):** Land improvements (non-depreciable land excluded).

| Component | Cost | Rationale | Legal Authority |
|-----------|------|-----------|----------------|
| Parking lots & paving | {{cost_parking}} | Land improvement, not building | Asset Class 00.3 |
| Curbs, gutters, sidewalks | {{cost_curbs}} | Grade-level, not structural | Asset Class 00.3 |
| Fencing (chain link, ornamental) | {{cost_fencing}} | Land improvement | Asset Class 00.3 |
| Retaining walls | {{cost_retaining_walls}} | Land improvement unless integral to building foundation | CCA 200016038 |
| Site lighting (pole-mounted) | {{cost_site_lighting}} | Land improvement | Asset Class 00.3 |
| Irrigation systems | {{cost_irrigation}} | Land improvement | Asset Class 00.3 |
| Playground equipment / site amenities | {{cost_site_amenities}} | Land improvement | Asset Class 00.3 |
| Utilities (site-based, not entry) | {{cost_site_utilities}} | Site utility connections | Asset Class 00.3 |

**39-Year Property (Non-residential) / 27.5-Year Property (Residential):** Building structural components that cannot be reclassified.

| Component | Cost | Depreciation Life | Rationale for Retention |
|-----------|------|-------------------|------------------------|
| Structural frame (foundation, columns, beams) | {{cost_frame}} | 39 / 27.5 | Inherently permanent; structural |
| Roof structure & covering | {{cost_roof}} | 39 / 27.5 | Integral to building enclosure |
| Exterior walls, windows, doors (non-specialty) | {{cost_exterior_walls}} | 39 / 27.5 | Building structure |
| Interior load-bearing walls & partitions | {{cost_load_bearing_walls}} | 39 / 27.5 | Structural partition |
| Elevators & escalators | {{cost_elevators}} | 39 / 27.5 | Permanently affixed; building function |
| Fire protection (sprinklers, detection) | {{cost_fire_suppression}} | 39 / 27.5 | Safety/structural; integral to building |
| Plumbing (rough-in, pipes, general fixtures) | {{cost_general_plumbing}} | 39 / 27.5 | Building service system |
| HVAC (general, not process-specific) | {{cost_general_hvac}} | 39 / 27.5 | Building comfort system |
| Electrical (main switch gear, panels, wiring) | {{cost_general_electrical}} | 39 / 27.5 | Building service capacity |
| General lighting (ceiling-mounted, recessed) | {{cost_general_lighting}} | 39 / 27.5 | Building illumination; not decorative |
| Interior non-load-bearing walls (gyp board) | {{cost_nonload_partitions}} | 39 / 27.5 | Building component, not equipment |

### Step 3: Depreciation Impact Analysis

**Cost Allocation Summary:**

| Recovery Period | Original Allocation | Reclassified Amount | Adjusted Allocation |
|----------------|-------------------|-------------------|-------------------|
| 5-Year | {{orig_5yr}} | {{reclass_5yr}} | {{adjusted_5yr}} |
| 7-Year | {{orig_7yr}} | {{reclass_7yr}} | {{adjusted_7yr}} |
| 15-Year | {{orig_15yr}} | {{reclass_15yr}} | {{adjusted_15yr}} |
| 39-Year (commercial) / 27.5 (residential) | {{orig_39yr}} | {{reclass_39yr}} | {{adjusted_39yr}} |

**Net Present Value Benefit:**

| Metric | Value |
|--------|-------|
| Total accelerated depreciation (Year 1) | {{yr1_depreciation}} |
| Depreciation without study (Year 1) | {{yr1_without_study}} |
| Year 1 benefit | {{yr1_benefit}} |
| NPV of total benefit ({{discount_rate}}% discount rate, {{holding_period}} years) | {{npv_benefit}} |
| Effective tax rate assumption | {{effective_tax_rate}}% (federal + state) |
| Positive/Negative 481(a) adjustment (look-back) | {{section_481_adjustment}} |

### Step 4: Methodology & Engineering Support

**Methodology Selected:** {{methodology}} (Detailed Engineering / Sampling / Residual Estimation / Rule of Thumb)
**Basis:** {{methodology_basis}}

**Supporting Documentation:**
- [ ] Architectural plans & specifications (sheet numbers: {{plan_sheets}})
- [ ] Contractor cost breakdown / schedule of values
- [ ] Change orders and site directives
- [ ] Site visit documentation (date: {{site_visit_date}}, personnel: {{site_visit_personnel}})
- [ ] Photographic evidence of building systems
- [ ] Vendor invoices for specialized equipment
- [ ] Expert engineering opinion (if applicable)

## output_format

Present as a complete cost segregation study:
1. **Executive Summary** -- total reclassification percentage, NPV benefit, methodology
2. **Property Description** -- building type, size, age, construction method
3. **Building Systems Analysis** -- CSI MasterFormat decomposition with costs
4. **Engineering Classification** -- detailed component classification by MACRS recovery period
5. **Depreciation Impact** -- NPV calculation using {{discount_rate}}% discount rate
6. **Documentation Appendix** -- plans references, site visit report, supporting legal authority

## constraints

- IRS Cost Segregation Audit Techniques Guide (ATG) is the authoritative reference -- all classifications should be defensible under the ATG
- Land is NOT depreciable -- separate land value from building and improvements
- A 50%+ reclassification rate triggers automatic IRS scrutiny -- ensure methodology is defensible
- The repair vs. capital improvement distinction under Reg. 1.263(a)-3 applies to tenant improvements and renovations
- Cost estimates without contractor backup reduce defensibility -- detailed engineering approach preferred
- MACRS tables must be applied using the correct convention (half-year, mid-month, mid-quarter)
- Section 179 bonus depreciation applies to qualified property -- confirm property qualifies in the relevant year
- For acquisitions, purchase price allocation between building, land, and personal property follows Reg. 1.1060-1
- Cost segregation study is a tax position -- disclosure on Form 3115 is generally not required unless changing prior depreciation method
- Engineering-based study provides stronger audit defense than "rule of thumb" methods
- State conformity to federal bonus depreciation varies -- confirm state treatment separately
