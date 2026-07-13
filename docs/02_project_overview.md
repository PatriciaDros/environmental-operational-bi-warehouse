# Project Overview

## Purpose

The purpose of this project is to redesign an Excel-based operational reporting system into a structured SQL data warehouse.

The warehouse provides a centralized repository for operational data while preserving the business relationships required for reporting and analysis.

---

# Business Domain

Environmental Consulting

Services include:

- Asbestos investigations
- Lead inspections
- Mold assessments
- Industrial hygiene
- Laboratory sample management
- School Construction Authority (SCA) projects

---

# Business Processes

The warehouse models the following operational processes:

- Contract Management
- Work Authorizations (WA)
- Job Management
- Employee Payroll
- Laboratory Reporting
- Requests for Payment (RFP)
- Payment Tracking

---

# Project Components

The warehouse consists of four primary layers.

## Source Layer

Operational Excel workbooks used by staff.

Examples include:

- Payroll
- Job List
- Work Authorizations
- Laboratory Reports
- Employee Master
- Contracts
- Fixed Price Schedule
- Requests for Payment

---

## Staging Layer

Stores imported source data with minimal transformation.

Purpose:

- Preserve source records
- Standardize data types
- Prepare data for warehouse loading

---

## Dimension Layer

Stores descriptive business entities.

Examples include:

- Jobs
- Employees
- Buildings
- Contracts
- Labor Roles
- Laboratory Facilities

---

## Fact Layer

Stores measurable business events.

Examples include:

- Labor
- Laboratory Activity
- Billing (planned)

---

# Project Deliverables

The completed Version 1 warehouse includes:

- SQL database
- ETL scripts
- Star-schema style data model
- Data dictionary
- Grain documentation
- Source-to-target mappings
- Validation queries
- Technical documentation

Future enhancements include:

- Dashboard development
- KPI reporting
- Automated ETL
