# Traceability Matrix

**Project:** Environmental Operational Business Intelligence Warehouse

**Version:** 1.0

---

# Purpose

This matrix ensures that every implementation artifact created for Version 1.0 is supported by the corresponding documentation.

Likewise, every chapter of the technical manual should be supported by working SQL, diagrams, screenshots, validation, or reporting.

The goal is simple:

> **The documentation is the guide.**

> **The repository is the evidence.**

A reader following the documentation should always be able to locate the implementation being described.

---

# Traceability Workflow

Every major implementation follows the same lifecycle.

```
Business Process
        │
        ▼
SQL Development
        │
        ▼
Validation
        │
        ▼
Documentation
        │
        ▼
Diagram
        │
        ▼
Screenshot
        │
        ▼
Git Commit
```

Only after all artifacts exist should the work be considered complete.

---

# Subject Area Traceability

## Payroll / Labor

| Artifact | Status |
|----------|--------|
| Business Rules | ✅ |
| Staging Table | ✅ |
| Dimension Tables | ✅ |
| SQL JOINS | 🔄 |
| Fact Labor | ⬜ |
| Validation Queries | ⬜ |
| Documentation | 🔄 |
| Diagram | ⬜ |
| Screenshot | ⬜ |
| Reporting Query | ⬜ |

---

## Laboratory

| Artifact | Status |
|----------|--------|
| Business Rules | ✅ |
| Staging Table | ✅ |
| Dimension Tables | ✅ |
| SQL JOINS | ⬜ |
| Fact Laboratory | ⬜ |
| Validation Queries | ⬜ |
| Documentation | 🔄 |
| Diagram | ⬜ |
| Screenshot | ⬜ |
| Reporting Query | ⬜ |

---

## Billing / Request for Payment

| Artifact | Status |
|----------|--------|
| Business Rules | ✅ |
| Staging Table | ✅ |
| Dimension Tables | 🔄 |
| SQL JOINS | ⬜ |
| Fact Job Summary | ⬜ |
| Validation Queries | ⬜ |
| Documentation | 🔄 |
| Diagram | ⬜ |
| Screenshot | ⬜ |
| Reporting Query | ⬜ |

---

# Technical Manual Traceability

| Chapter | Supported By | Status |
|----------|--------------|--------|
| Executive Summary | Repository | ✅ |
| Project Overview | Repository | ✅ |
| Business Problem | Business documentation | ✅ |
| Business Processes | Business diagrams | 🔄 |
| Solution Architecture | Architecture diagram | 🔄 |
| Data Flow | ETL diagram | ⬜ |
| Data Model | ERD | ⬜ |
| ETL Design | SQL scripts | 🔄 |
| Data Dictionary | Reference documentation | 🔄 |
| Data Validation | Validation SQL | ⬜ |
| Reporting | Reporting SQL | ⬜ |
| Future Enhancements | Version 2 Ideas | ✅ |

---

# Definition of Done

A subject area is complete when all of the following have been completed.

## SQL

- [ ] Tables created
- [ ] ETL completed
- [ ] SQL validated

---

## Documentation

- [ ] Technical Manual updated
- [ ] Data Dictionary updated
- [ ] Business Rules updated

---

## Visual Artifacts

- [ ] Diagram
- [ ] Screenshot
- [ ] Sample SQL output

---

## Portfolio

- [ ] GitHub committed
- [ ] README updated (if needed)

---

# Status Legend

| Symbol | Meaning |
|---------|---------|
| ⬜ | Not Started |
| 🔄 | In Progress |
| ✅ | Complete |

---

# Guiding Principle

The implementation and documentation should progress together.

No SQL should exist without documentation.

No documentation should describe functionality that does not yet exist.

> **Show and tell must align.**
