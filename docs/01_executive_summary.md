# Executive Summary

## Environmental Operational Business Intelligence Warehouse

**Version 1.0**

---

## Purpose

The Environmental Operational Business Intelligence Warehouse is a custom-designed operational reporting database developed to consolidate operational data from numerous business sources into a centralized SQL database.

The warehouse integrates information originating from a New York City public agency under contract with the company, internally maintained Microsoft Excel workbooks, technician field logs, laboratory reports, regulatory reporting systems, project documentation, payroll records, contractor documentation, and licensing records into a single relational reporting system.

Rather than being developed from a public dataset or tutorial, the warehouse was designed from real operational requirements encountered while supporting environmental consulting projects.

---

## Project Background

## Project Background

The Environmental Operational Business Intelligence Warehouse originated from the need to answer recurring operational questions that were critical to project execution, billing, payroll, and revenue collection.

Answering these questions required assembling and reconciling information from numerous business sources, including technician field logs, laboratory reports, work authorizations, project documentation, payroll records, contractor documentation, licensing records, regulatory reporting systems, and internally maintained tracking workbooks.

As business operations expanded, the same jobs, employees, contracts, and billing information were recorded across multiple independent systems. Maintaining these relationships manually became increasingly difficult, making it time-consuming to determine project status, verify supporting documentation, reconcile labor and laboratory activity, and prepare completed jobs for billing.

To address these challenges, a series of operational Excel-based tracking systems were developed to organize and relate the information required to answer these business questions. Over time, those systems evolved into an integrated operational reporting solution, ultimately becoming the foundation for the SQL data warehouse documented in this repository.

---

## Project Objectives

This project was built to answer the questions the business was asking every day.

The objectives of Version 1.0 are to:

- Bring together information that was scattered across multiple business systems into one place.
- Connect related information so a job can be followed from work authorization through payroll, laboratory work, billing, and payment.
- Make it easier to determine what is missing before a job is submitted for payment.
- Reduce the time spent manually searching through spreadsheets, paperwork, and reports to answer operational questions.
- Replace disconnected Excel workbooks with a structured SQL database that reflects how the business actually operates.
- Create a documented foundation that can support future reporting and dashboards.

---

## Warehouse Components

Version 1.0 of the warehouse consists of four primary components. Each component serves a distinct purpose within the overall architecture and builds upon the previous layer.

### Source Systems

The source systems represent the operational side of the business where information is created and maintained. Data originates from a variety of sources, including public agency downloads, internally maintained Excel workbooks, technician field logs, laboratory reports, payroll records, project documentation, contractor documentation, and licensing records.

### Staging Layer

The staging layer is the entry point into the warehouse. Data is imported from the source systems with minimal transformation, preserving the original records while preparing them for integration into the warehouse.

### Dimension Layer

The dimension tables organize the descriptive information used throughout the warehouse, such as employees, jobs, contracts, buildings, laboratories, and labor roles. They provide the business context needed to interpret the operational data.

### Fact Layer

The fact tables record the measurable business activities performed by the company, including labor, laboratory services, and billing events. These tables support reporting by capturing what occurred, when it occurred, and the quantities associated with each business event.

---

## Repository Contents

At the current stage of development, this repository contains:

- SQL scripts used to create the database and warehouse tables.
- ETL scripts used to load and transform operational data.
- Project documentation describing the warehouse design and implementation.
- Table grain documentation for the staging, dimension, and fact tables.
- Sample data used for development and testing.
- Supporting screenshots that document the development process.

Additional documentation, diagrams, and reporting examples will be added as Version 1.0 is completed.

---

## Technology Stack

| Component | Technology |
|----------|------------|
| Source Data | Microsoft Excel |
| Database | MySQL |
| SQL Development | MySQL Workbench |
| Version Control | Git & GitHub |
| Documentation | Markdown |

---

## Current Status

Version 1.0 is an active development project.

The warehouse is being designed and built one component at a time while documenting the design decisions, business processes, and SQL implementation along the way.

The current focus is establishing a solid warehouse foundation, including the database structure, ETL processes, and technical documentation. Additional reporting and dashboards will be considered after the warehouse is complete.

---

## Document Organization

The repository documentation is organized as a technical design manual.

Readers unfamiliar with the project are encouraged to read the documentation in sequence, beginning with the Executive Summary and continuing through the Business Problem, Business Processes, Solution Architecture, and Implementation chapters.

Each chapter builds upon the previous one to explain both the business context and the technical implementation of the warehouse.

---

## Version Statement

This document describes **Version 1.0** of the Environmental Operational Business Intelligence Warehouse.

Version 1.0 represents a complete, documented implementation of the warehouse architecture and serves as the foundation for future enhancements.
