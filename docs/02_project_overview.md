# Project Overview

## Purpose

The Environmental Operational Business Intelligence Warehouse was developed to organize the operational information needed to manage environmental consulting projects from the start of a job through final payment.

The project began as a series of Excel-based tools created to solve everyday business problems. These included tracking required project documentation, recording technician labor, monitoring laboratory reports, preparing Final Reports, reducing payroll reporting errors, and answering operational questions that could not be answered quickly using the existing systems.

As additional business problems were solved, the relationships between jobs, employees, contracts, work authorizations, laboratory reports, payroll, and billing became clearer. What began as individual operational workbooks gradually evolved into an integrated SQL database that models how the business actually operates.

The warehouse was not designed all at once. It was developed incrementally as business processes became better understood and the relationships between the data emerged through daily use.

---

## Business Domain

This project is based on the day-to-day operations of an environmental consulting company.

The business performs services such as:

- Environmental investigations
- Project monitoring
- Laboratory sample management
- Regulatory reporting
- Contract administration
- Billing and payment tracking

---

## Business Questions

The warehouse was designed to answer questions such as:

- Is this job ready to be submitted for payment?
- If not, what information or documentation is still missing?
- Did a technician work on a specific job on a particular day?
- Were the reported hours entered correctly and submitted to payroll?
- Have all laboratory reports been received?
- Has the required project documentation been collected?
- Has the job been billed?
- Has payment been received?

These questions drive the design of the warehouse and the relationships between its tables.

---

## Business Processes

Version 1.0 models the following operational processes:

- Contract management
- Work authorizations
- Job management
- Technician labor
- Laboratory reporting
- Payroll
- Requests for payment
- Payment tracking

Each process contributes information that supports the overall lifecycle of a project.

---

## Current Scope

Version 1.0 focuses on building and documenting the operational data warehouse.

Current work includes:

- SQL database development
- Staging tables
- Dimension tables
- Fact tables
- ETL processes
- Technical documentation
- Data dictionary
- Business rules
- Warehouse architecture

Reporting dashboards and additional automation are outside the scope of Version 1.0 and may be considered in a future release.
