# Data Flow Architecture

This chapter answers that high-level question,
"Where does the data come from, and how does it become useful for reporting?"

## Why This Chapter Matters

The previous chapter described how the warehouse is organized into source systems, staging tables, dimension tables, and fact tables.

This chapter follows the movement of data through those layers, from its original source to the finished warehouse.

Understanding this flow helps explain how information from many different business sources becomes one connected reporting system.

---

# Overview

Business information is created in many different places.

Some information is downloaded from a public agency client, while other information is entered internally or collected during the normal course of business.

Rather than reporting directly from these sources, the warehouse imports, organizes, and connects the data before it is used for reporting.

The simplified data flow is shown below.

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
        │
        ▼
Reporting
```

Each stage has a specific purpose and prepares the data for the next stage.

---

# Step 1 — Business Sources

The warehouse begins with operational data created during the day-to-day activities of the business.

Examples include:

- Public agency downloads
- Internal tracking workbooks
- Payroll records
- Technician field logs
- Laboratory reports
- Project documentation
- Contract information
- Licensing records

Each source represents a different part of the business.

---

# Step 2 — Staging Tables

The first destination for imported data is the staging layer.

The staging tables preserve the source information with minimal transformation.

At this stage, the focus is on importing the data accurately rather than preparing it for reporting.

Examples include:

- Work Authorizations
- Payroll
- Job List
- Laboratory Reports
- Employees
- Contracts

---

# Step 3 — Dimension Tables

Once the source data has been imported, the warehouse identifies the business entities that are shared across multiple processes.

Examples include:

- Employees
- Jobs
- Buildings
- Contracts
- Labor Roles
- Laboratory Facilities

Organizing this information into dimension tables reduces duplication and provides consistent business definitions throughout the warehouse.

---

# Step 4 — Fact Tables

The fact tables combine the business entities with measurable business events.

Examples include:

- Employee labor
- Laboratory activity
- Requests for payment

Each fact table has a clearly defined grain that determines what a single row represents.

This allows the warehouse to answer operational questions consistently across the business.

---

# Step 5 — Reporting

The completed warehouse provides a single source of operational information.

Rather than searching through multiple spreadsheets and reports, information can be retrieved by querying the warehouse.

Version 1.0 focuses on building the reporting foundation. Dashboards and additional reporting tools may be added in future versions.

---

# End-to-End Flow

The overall movement of data through the warehouse can be summarized as follows.

```
Operational Business Processes
            │
            ▼
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
            │
            ▼
Business Questions
```

The warehouse was designed so that each stage adds structure and business meaning to the data while preserving the relationships needed to answer operational questions.

---

# Looking Ahead

The next chapter describes the warehouse data model and explains how the staging, dimension, and fact tables relate to one another.
