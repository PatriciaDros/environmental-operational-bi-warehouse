# Project Roadmap

**Project:** Environmental Operational Business Intelligence Warehouse

**Version:** 1.0

---

# Purpose

This roadmap tracks the remaining work required to complete Version 1.0 of the Environmental Operational Business Intelligence Warehouse.

Version 1.0 is focused on producing a complete, well-documented operational data warehouse that accurately reflects the current implementation of the project.

The roadmap follows the project standards:

> Build one artifact at a time.

> Show and tell must align.

> Done beats perfect.

---

# Current Status

## Documentation

✅ Repository structure established

✅ Documentation structure finalized

✅ Technical Manual (Draft 1) completed

---

## Warehouse

🔄 SQL warehouse currently under active development.

Current implementation includes:

- Database creation
- Staging tables
- Dimension design
- Fact table design
- Initial ETL development
- Initial SQL joins

---

# Current Milestone

## Synchronize the Repository

The next phase of the project is bringing the implementation into alignment with the documentation.

Every completed warehouse component should include:

- SQL
- Documentation
- Diagram
- Validation
- Screenshot
- Git commit

---

# Phase 1 — Repository Organization

## Documentation

- [ ] Create `docs/book/`
- [ ] Move Chapters 00–12
- [ ] Update Markdown links
- [ ] Verify navigation
- [ ] Commit changes

---

## SQL Repository

Review every SQL script currently in the repository.

- [ ] Remove obsolete scripts
- [ ] Remove duplicate scripts
- [ ] Standardize naming
- [ ] Organize scripts into folders

Create the final SQL structure.

```text
sql/
│
├── 00_create_database/
├── 01_staging/
├── 02_dimensions/
├── 03_bridges/
├── 04_facts/
├── 05_views/
├── 06_seed/
├── 07_load/
└── 99_utilities/
```

Move every script into its proper location.

---

# Phase 2 — Complete the Warehouse

Build one subject area at a time.

For each business area:

- [ ] SQL
- [ ] Validation
- [ ] Documentation
- [ ] Diagram
- [ ] Screenshot
- [ ] Git Commit

Current priority:

### Labor

- [ ] Complete joins
- [ ] Finish Fact Labor
- [ ] Validate results
- [ ] Update documentation

Future subject areas:

- [ ] Laboratory
- [ ] Billing
- [ ] Payment Tracking

---

# Phase 3 — Technical Documentation

## Editorial Review

Review the complete technical manual.

- [ ] Writing style
- [ ] Grammar
- [ ] Chapter transitions
- [ ] Duplicate information
- [ ] Internal links

---

## Data Dictionary

Complete reference documentation.

- [ ] Staging table grains
- [ ] Dimension table grains
- [ ] Fact table grains
- [ ] Table relationships
- [ ] Column dictionary

---

## SQL Documentation

Review every SQL script.

Document:

- [ ] Purpose
- [ ] Inputs
- [ ] Outputs
- [ ] Dependencies
- [ ] Notes

---

# Phase 4 — Diagrams

## Business

- [ ] Business Process Lifecycle
- [ ] High-Level Architecture

---

## ETL

- [ ] Payroll Pipeline
- [ ] Laboratory Pipeline
- [ ] Billing Pipeline

---

## Data Model

- [ ] Warehouse ERD
- [ ] Fact Labor Star Schema
- [ ] Fact Laboratory Star Schema

---

## Data Lineage

- [ ] Source-to-Warehouse Lineage

---

# Phase 5 — Validation

Develop SQL validation queries.

- [ ] Record counts
- [ ] Duplicate detection
- [ ] Missing relationships
- [ ] Payroll reconciliation
- [ ] Laboratory reconciliation
- [ ] Billing reconciliation

Document validation results.

---

# Phase 6 — Screenshots

Capture supporting screenshots.

## Source Systems

- [ ] Operational workbooks
- [ ] Sample source files

---

## SQL

- [ ] Database schema
- [ ] Table creation
- [ ] ETL execution
- [ ] Example joins
- [ ] Example queries

---

## Validation

- [ ] Validation queries
- [ ] Data quality checks

---

## Reporting

- [ ] SQL reports
- [ ] Dashboard (if available)

For every screenshot document:

- Figure Number
- Title
- Purpose
- Discussion
- Observations

---

# Phase 7 — Repository Review

Review the repository as if you were an employer.

## Documentation

- [ ] Navigation
- [ ] Broken links
- [ ] Formatting
- [ ] Images

---

## SQL

- [ ] Script organization
- [ ] Execution order
- [ ] Comments
- [ ] Naming conventions

---

## GitHub

- [ ] README
- [ ] Repository organization
- [ ] License
- [ ] .gitignore

---

# Home Mac Tasks

Tasks requiring the development environment.

## Git

- [ ] Create `docs/book/`
- [ ] Move documentation
- [ ] Update links
- [ ] Commit reorganization

---

## SQL

- [ ] Organize SQL folders
- [ ] Export ERD
- [ ] Test scripts

---

## Lucidchart

- [ ] Update diagrams
- [ ] Export PNG
- [ ] Save editable versions

---

## Screenshots

- [ ] Capture SQL screenshots
- [ ] Capture validation screenshots

---

# Version 1.0 Release Checklist

Version 1.0 will be complete when the following are finished.

## Warehouse

- [ ] SQL implementation complete
- [ ] ETL complete
- [ ] Validation complete

---

## Documentation

- [ ] Technical Manual
- [ ] Data Dictionary
- [ ] SQL Documentation

---

## Technical Artifacts

- [ ] Business diagrams
- [ ] ETL diagrams
- [ ] ERD
- [ ] Screenshots

---

## Repository

- [ ] Repository review
- [ ] Final validation
- [ ] Final Git commit

---

# Working Method

Every work session follows the same process.

```
Business Problem
        ↓
SQL Development
        ↓
Validation
        ↓
Documentation
        ↓
Diagram
        ↓
Screenshot
        ↓
Git Commit
```

Complete one artifact before beginning the next.

---

# Related Documents

- `PROJECT_STANDARDS.md`
- `TRACEABILITY_MATRIX.md`
- `version_2_ideas.md`

---

# Guiding Principles

> Document reality.

> Show and tell must align.

> Build one artifact at a time.

> Done beats perfect.
