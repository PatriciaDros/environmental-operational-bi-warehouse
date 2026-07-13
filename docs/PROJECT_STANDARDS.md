# Project Standards

**Project:** Environmental Operational Business Intelligence Warehouse

**Version:** 1.0

---

# Purpose

This document defines the standards used to develop and document the Environmental Operational Business Intelligence Warehouse.

These standards help ensure the project remains organized, consistent, and focused on completing Version 1.0.

When questions arise during development, these standards should be consulted before introducing new structure or documentation.

---

# Rule 1 — One Document, One Purpose

Each Markdown document should answer one primary question.

Examples:

- What is this project?
- What business problem does it solve?
- How does the payroll process work?
- What is the grain of Fact Labor?

Avoid combining multiple unrelated topics into the same document.

---

# Rule 2 — Every Screenshot Has a Purpose

Screenshots are included as supporting evidence, not decoration.

Each screenshot should include:

- Figure Number
- Title
- Purpose
- Discussion
- Observations

Every screenshot should help explain or validate part of the project.

---

# Rule 3 — Every Diagram Tells One Story

Each diagram should explain one concept.

Examples include:

- High-Level Architecture
- Business Process
- Payroll ETL Pipeline
- Laboratory ETL Pipeline
- Warehouse ERD
- Star Schema

Avoid creating diagrams that attempt to explain the entire warehouse at once.

---

# Rule 4 — Every SQL Script Is Documented

Every SQL script should include documentation describing:

- Purpose
- Inputs
- Outputs
- Dependencies
- Objects Created
- Objects Modified (if applicable)

The goal is to explain why the script exists, not simply what SQL statements it contains.

---

# Rule 5 — Write for a New Reader

Assume the reader has no prior knowledge of:

- The company
- Environmental consulting
- Business processes
- Database design
- The warehouse

The documentation should guide the reader from the business problem through the completed implementation.

---

# Rule 6 — One Artifact Per Session

Each work session should produce one completed artifact.

Examples include:

- README
- Executive Summary
- Business Process documentation
- Payroll ETL Diagram
- Fact Table documentation

Complete the artifact before beginning another.

---

# Rule 7 — Document Reality

Document the project as it exists today.

Do not:

- Create empty folders.
- Document features that have not been implemented.
- List diagrams that do not exist.
- Describe dashboards that have not been built.

Future work belongs in the Version 2.0 Ideas document.

---

# Rule 8 — Separate Summary from Story

Each document has a specific purpose.

For example:

Executive Summary answers:

> What is this project?

Business Problem answers:

> Why was it built?

Avoid mixing project summaries with implementation history or personal narrative.

---

# Rule 9 — Business Before Technology

Always explain the business problem before the technical solution.

The recommended flow is:

Business Problem

↓

Business Process

↓

Technical Solution

↓

Implementation

The warehouse exists to solve business problems, not simply to demonstrate SQL.

---

# Rule 10 — Use a Natural Technical Voice

Write as an experienced operations analyst explaining the system to a knowledgeable coworker.

Avoid:

- Marketing language
- Corporate buzzwords
- Generic textbook definitions
- Unnecessary jargon

Aim for writing that is:

- Clear
- Accurate
- Specific
- Professional
- Easy to read

---

# Rule 11 — Protect Confidentiality

The project is based on real business operations.

Documentation should:

- Describe business processes accurately.
- Preserve technical implementation details.
- Anonymize clients and proprietary business information.
- Remove or replace sensitive identifiers where appropriate.

The goal is to demonstrate technical skills while respecting confidentiality.

---

# Rule 12 — Version 2.0 Parking Lot

When improvements are identified that fall outside the scope of Version 1.0:

Do not redesign Version 1.0.

Instead, record them in:

```
docs/version_2_ideas.md
```

Continue working on the current Version 1.0 artifact.

---

# Rule 13 — Done Beats Perfect

Version 1.0 is intended to be complete, not perfect.

The objective is to produce a fully functioning, well-documented project that accurately represents the work completed.

Small improvements should not delay completion.

Future enhancements can be incorporated into Version 2.0.

---

# Rule 14 — Build One Layer at a Time

Build and document the project incrementally.

Complete one layer before moving to the next.

For example:

- Documentation
- SQL
- ETL
- Diagrams
- Validation

Avoid jumping between multiple unfinished tasks.

---

# Rule 15 — Commit Completed Work

Each completed artifact should be committed to Git with a meaningful commit message.

Examples:

- Complete README
- Add Executive Summary
- Document staging table grains
- Add Payroll ETL pipeline

The commit history should clearly show the evolution of the project.

---

# Guiding Principle

The Environmental Operational Business Intelligence Warehouse is both a real business solution and a technical portfolio project.

Every artifact should contribute to a repository that is:

- Complete
- Understandable
- Well organized
- Technically accurate
- Professionally documented

When faced with a decision, choose the option that helps move Version 1.0 toward completion.

> **Done beats perfect.**
