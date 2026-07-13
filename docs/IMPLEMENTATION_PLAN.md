# Implementation Plan

**Project:** Environmental Operational Business Intelligence Warehouse

**Version:** 1.0

---

# Purpose

This document provides the implementation plan for completing Version 1.0 of the Environmental Operational Business Intelligence Warehouse.

Unlike the Technical Manual, which explains the warehouse, this document describes the order in which the remaining components will be built.

The goal is to complete one business area at a time while keeping the SQL implementation, documentation, diagrams, screenshots, and repository synchronized.

---

# Current Status

## Completed

### Documentation

- Technical Manual (Draft 1)
- Project Standards
- Project Roadmap
- Traceability Matrix

### SQL

- Database created
- Curated dataset loaded
- Staging tables created
- Dimension tables created
- Date dimension seeded

---

## Current Work

The warehouse structure has been established.

The current focus is completing the SQL joins required to build the warehouse fact tables.

Current task:

- SQL JOIN development

---

# Implementation Order

The remaining implementation will follow this sequence.

```
SQL Joins
        ↓
Fact Tables
        ↓
Validation
        ↓
Reporting Queries
        ↓
Visualizations
        ↓
Portfolio Assets
```

---

# Phase 1 — SQL JOIN Development

## Goal

Learn SQL joins while connecting the warehouse tables correctly.

Deliverables:

- INNER JOIN
- LEFT JOIN
- Multi-table joins
- Join validation

Primary outcome:

A complete understanding of how the warehouse tables relate to one another.

---

# Phase 2 — Fact Tables

Complete each fact table individually.

## Fact Labor

Deliverables:

- Complete joins
- Business rules
- Measures
- Validation

Questions answered:

- Who worked?
- Where?
- When?
- For how long?
- Under which contract?

---

## Fact Laboratory

Deliverables:

- Complete joins
- Laboratory mapping
- Sample quantities
- Validation

Questions answered:

- What samples were collected?
- Which laboratory processed them?
- What was the cost?

---

## Fact Job Summary

Deliverables:

- Revenue
- Labor cost
- Laboratory cost
- Profit calculations
- Billing status

Questions answered:

- Is the job complete?
- Has it been billed?
- Has payment been received?
- What was the profit?

---

# Phase 3 — Validation

Validate every fact table.

Deliverables:

- Record counts
- Totals
- Missing relationships
- Duplicate detection
- Business rule verification

Validation should be completed before reporting begins.

---

# Phase 4 — Reporting Queries

Develop SQL queries that answer the business questions.

Examples include:

- Jobs ready for payment
- Missing documentation
- Labor by technician
- Laboratory costs
- Profit by project
- Payment status

These queries demonstrate that the warehouse supports operational reporting.

---

# Phase 5 — Visualizations

The objective is to demonstrate that the warehouse supports decision making.

Version 1.0 does not require a polished BI solution.

Done beats perfect.

Possible deliverables include:

## Option A (Recommended)

Simple PowerPoint presentation.

Include:

- Business problem
- Warehouse architecture
- ERD
- Example SQL
- Reporting examples
- Lessons learned

---

## Option B

Python notebook.

Include:

- SQL query
- Pandas
- Basic charts
- Short explanation

---

## Option C

Tableau dashboard

or

Power BI dashboard

if completed.

---

## Option D

GitHub screenshots

Showing:

- SQL
- Query results
- Fact tables
- Validation
- Diagrams

Any of these demonstrate the value of the warehouse.

---

# Phase 6 — Portfolio Review

Review the project from the perspective of a hiring manager.

Ask:

- Can I understand the business problem?
- Can I follow the documentation?
- Can I find the SQL?
- Can I understand the warehouse?
- Can I verify the implementation?
- Can I see reporting examples?

If the answer is "yes" to each question, Version 1.0 is complete.

---

## Definition of Done

A phase is complete when:

- [ ] SQL implemented
- [ ] SQL validated
- [ ] Documentation updated
- [ ] Data dictionary updated
- [ ] Diagram updated (if applicable)
- [ ] Screenshot captured
- [ ] GitHub committed
- [ ] Traceability Matrix updated

---

# Guiding Principle

The objective is not to build every possible feature.

The objective is to produce a complete warehouse that demonstrates:

- Business understanding
- Data modeling
- SQL
- ETL
- Documentation
- Validation
- Reporting

Everything should support one story.

> **Show and tell must align.**
