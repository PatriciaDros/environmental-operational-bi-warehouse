# PROJECT TODO

**Project:** Environmental Operational Business Intelligence Warehouse

This document tracks the remaining work required to complete Version 1.0.

---

# Current Milestone

✅ Repository structure established

✅ Documentation structure finalized

✅ Technical manual (Draft 1) completed

The remaining work focuses on completing the technical artifacts that support the documentation.

---

# High Priority

## Documentation Organization

- [ ] Create `docs/book/` folder.
- [ ] Move Chapters 00–12 into `docs/book/`.
- [ ] Update internal Markdown links after moving files.
- [ ] Commit documentation reorganization.

**Status:** Home Mac task (VS Code / Git)

---

## Technical Manual Review

Complete one editorial review of the documentation.

Review for:

- [ ] Consistent writing style
- [ ] Grammar and spelling
- [ ] Duplicate information
- [ ] Broken links
- [ ] Chapter transitions
- [ ] Figure references

---

# Diagrams

## Business Diagrams

- [ ] Business Process Lifecycle
- [ ] High-Level Warehouse Architecture

---

## ETL Diagrams

- [ ] Payroll ETL Pipeline
- [ ] Laboratory ETL Pipeline
- [ ] Billing / Request for Payment Pipeline

---

## Data Model

- [ ] Complete Warehouse ERD
- [ ] Fact Labor Star Schema
- [ ] Fact Laboratory Star Schema

---

## Data Lineage

- [ ] Create source-to-warehouse lineage diagram

---

# Data Dictionary

Complete the reference documentation.

- [ ] Finish staging table grains
- [ ] Finish dimension table grains
- [ ] Finish fact table grains
- [ ] Complete table relationships
- [ ] Complete column dictionary

---

# SQL Documentation

Review every SQL script.

For each script document:

- [ ] Purpose
- [ ] Inputs
- [ ] Outputs
- [ ] Dependencies
- [ ] Notes

---

# SQL Repository Review

Review the SQL repository for consistency.

- [ ] Verify folder organization
- [ ] Remove obsolete scripts
- [ ] Rename scripts for consistency
- [ ] Confirm scripts execute in the correct order
- [ ] Verify naming conventions
- [ ] Add comments where needed

---

# Data Validation

Develop and organize validation queries.

- [ ] Payroll validation
- [ ] Laboratory validation
- [ ] Billing validation
- [ ] Record count validation
- [ ] Relationship validation
- [ ] Duplicate record checks

---

# Screenshots

Capture screenshots that support the documentation.

## Source Systems

- [ ] Example operational workbooks
- [ ] Sample source files

---

## SQL Development

- [ ] Database schema
- [ ] Table creation
- [ ] ETL execution
- [ ] Example SQL queries

---

## Validation

- [ ] Validation query results
- [ ] Data quality checks

---

## Reporting

- [ ] Example SQL reports
- [ ] Dashboard screenshots (if available)

For every screenshot include:

- [ ] Figure Number
- [ ] Title
- [ ] Purpose
- [ ] Discussion
- [ ] Observations

---

# GitHub Repository

Review the repository before Version 1.0 release.

- [ ] README review
- [ ] Folder organization
- [ ] Navigation
- [ ] Documentation links
- [ ] Image links
- [ ] .gitignore review
- [ ] License review

---

# Final Quality Review

Before declaring Version 1.0 complete:

## Documentation

- [ ] Review complete technical manual.
- [ ] Verify chapter numbering.
- [ ] Verify cross references.
- [ ] Proofread all documentation.

## SQL

- [ ] Verify every script executes successfully.
- [ ] Verify warehouse build order.
- [ ] Verify ETL order.

## Technical Artifacts

- [ ] Verify diagrams.
- [ ] Verify screenshots.
- [ ] Verify data dictionary.
- [ ] Verify validation documentation.

## Repository

- [ ] Confirm repository reflects current implementation.
- [ ] Remove temporary files.
- [ ] Final GitHub commit.

---

# Home Mac Tasks

Tasks requiring the home development environment.

## Git / GitHub

- [ ] Create `docs/book/`.
- [ ] Move documentation chapters.
- [ ] Update Markdown links.
- [ ] Commit documentation reorganization.

## Lucidchart

- [ ] Update architecture diagrams.
- [ ] Export PNG versions.
- [ ] Save editable Lucid files.

## SQL

- [ ] Capture SQL screenshots.
- [ ] Test SQL scripts.
- [ ] Export ERD.

---

# Version 1.0 Release Checklist

Version 1.0 is complete when the following have been finished:

- [ ] Technical manual
- [ ] Architecture diagrams
- [ ] ETL diagrams
- [ ] ERD
- [ ] Data dictionary
- [ ] SQL documentation
- [ ] Validation documentation
- [ ] Screenshots
- [ ] Repository review
- [ ] Final GitHub release

---

# Parking Lot

Ideas intentionally outside the scope of Version 1.0 are documented in:

`docs/version_2_ideas.md`

---

# Guiding Principle

> **Done beats perfect.**

Version 1.0 is intended to be complete, well documented, and representative of the work performed.

Future improvements belong in Version 2.0.
