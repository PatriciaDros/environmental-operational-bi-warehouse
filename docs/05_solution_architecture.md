# Solution Architecture

## Why This Chapter Matters

The previous chapters described the business problems and operational processes that led to the development of the warehouse.

This chapter explains how those business processes were translated into a structured SQL database and why the warehouse was organized the way it was.

The goal was not simply to move data from Excel into SQL. The goal was to create a system that organizes information according to how the business operates.

---

# Design Philosophy

The warehouse was developed one business process at a time.

It was not designed all at once.

As the relationships between jobs, contracts, work authorizations, employees, laboratory reports, payroll, and billing became clearer, the database design evolved to reflect those relationships.

Whenever the data did not fit naturally into the model, it usually meant the business process needed to be understood better before moving forward.

---

# Architectural Overview

Version 1.0 follows a simple layered architecture.

```
Business Sources
        │
        ▼
 Staging Tables
        │
        ▼
Dimension Tables
        │
        ▼
   Fact Tables
```

Each layer has a specific purpose and prepares the data for the next stage.

---

# Source Systems

The source systems represent where the business records its day-to-day operations.

Information comes from several operational sources, including:

- Public agency downloads
- Internal Excel workbooks
- Technician field logs
- Laboratory reports
- Payroll records
- Project documentation
- Licensing records

Each source contributes part of the overall business process.

---

# Staging Layer

The staging layer is the warehouse's landing area.

Source data is imported with very little transformation.

The primary goals of the staging layer are to:

- Preserve the original source data.
- Standardize formats and data types.
- Prepare the data for integration into the warehouse.

The staging tables remain closely aligned with their source systems.

---

# Dimension Layer

The dimension tables organize the descriptive information used throughout the warehouse.

Examples include:

- Employees
- Jobs
- Contracts
- Buildings
- Labor Roles
- Laboratory Facilities

Rather than repeating this information throughout the warehouse, it is stored once and referenced wherever it is needed.

---

# Fact Layer

The fact tables record the measurable business activities performed by the company.

Examples include:

- Technician labor
- Laboratory activity
- Requests for payment

Each fact table represents a specific business event at a clearly defined level of detail, known as its grain.

The fact tables are designed to answer the operational questions described earlier in this documentation.

---

# Why This Architecture

Several alternative approaches were considered during development, including continuing to expand the existing Excel workbooks.

Instead, a layered SQL database was chosen because it:

- Organizes related business information into a single system.
- Reduces duplicate data.
- Preserves relationships between operational processes.
- Makes business questions easier to answer.
- Provides a foundation for future reporting.

The architecture reflects the way the business operates rather than the way the original spreadsheets were organized.

---

# Version 1.0 Scope

Version 1.0 focuses on establishing a well-documented operational warehouse.

Current work includes:

- Source data integration
- SQL table design
- ETL development
- Data dictionary
- Business rules
- Technical documentation

Additional automation and reporting will build upon this foundation in future versions.

---

# Looking Ahead

The next chapter follows the movement of data through the warehouse, from the original business sources to the completed fact tables.
