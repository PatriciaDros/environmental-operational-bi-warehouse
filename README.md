# Environmental Operational Business Intelligence Warehouse

A custom SQL-based operational data warehouse that consolidates multiple Excel-based business processes into a centralized reporting database for an environmental consulting company.

---

## Project Overview

This project began as an attempt to solve a very practical problem rather than as a technical exercise.

One of my responsibilities was preparing Final Reports and Compensation Worksheets for School Construction Authority (SCA) projects. Completing a single job required collecting information from multiple Excel workbooks, technician logbooks, laboratory reports, work authorizations, inspection reports, payroll records, and supporting documentation.

Each source answered only part of the story. Bringing everything together accurately was time-consuming, repetitive, and prone to errors.

What started as a collection of Excel workbooks to solve individual operational problems gradually evolved into an integrated operational reporting system and ultimately into this SQL-based data warehouse.

The goal of this project is to preserve that operational knowledge while demonstrating practical data modeling, ETL design, and warehouse development using real business processes.

For the complete project background, see **docs/03_business_problem.md**.

---

## Business Problems

The warehouse was designed to answer questions that could not easily be answered using the existing Excel workbooks or QuickBooks.

Examples include:

- Is a job ready to be submitted for payment?
- What documents are still missing?
- Did every technician submit their project log?
- Was every technician paid for the hours they worked?
- What labor was performed on a specific job?
- How many laboratory samples were collected and processed?
- Has an RFP been submitted?
- Has the payment been received?

---

## Project Objectives

The objectives of Version 1.0 are to:

- Consolidate operational data from multiple Excel workbooks.
- Design and implement a relational SQL database.
- Organize operational data into staging, dimension, and fact tables.
- Document the complete warehouse architecture.
- Develop repeatable SQL ETL processes.
- Create a reusable foundation for future reporting and dashboard development.

---

## Technology Stack

| Component | Technology |
|-----------|------------|
| Source Systems | Microsoft Excel |
| Database | MySQL |
| SQL IDE | MySQL Workbench |
| Documentation | Markdown |
| Version Control | Git & GitHub |

---

## Repository Structure

```
README.md
docs/
sql/
sample_data/
images/
```

Complete technical documentation is available in the **docs** folder.

---

## Current Status

Version 1.0 is currently under active development.

Completed components include:

- SQL database schema
- Staging tables
- Dimension tables
- Fact tables
- ETL scripts
- Technical documentation
- Data dictionary

Dashboard development is planned for a future release.

---

## About This Project

This repository documents the design and implementation of a custom operational data warehouse built from real business requirements.

Rather than using a public dataset, the warehouse was designed around actual operational workflows in environmental consulting. The project demonstrates how business processes can be translated into a structured SQL reporting system using dimensional modeling concepts, ETL pipelines, and comprehensive technical documentation.
