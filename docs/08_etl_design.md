# ETL Design

## Why This Chapter Matters

The previous chapters described the business, the warehouse architecture, and the data model.

This chapter describes how operational data is moved from the source systems into the warehouse.

Version 1.0 uses a manual ETL process. Source data is exported from the operational systems, reviewed as needed, and loaded into SQL staging tables before being transformed into the warehouse.

---

# ETL Overview

The ETL process follows the same general pattern for each source system.

```
Business Source
        │
        ▼
 Import into Staging Table
        │
        ▼
 Data Cleaning
        │
        ▼
 Load Dimension Tables
        │
        ▼
 Load Fact Tables
        │
        ▼
 Validation
```

Each stage prepares the data for the next while preserving the relationships needed throughout the warehouse.

---

# Extract

Data is collected from the operational systems used by the business.

Current data sources include:

- Public agency downloads
- Internal Excel workbooks
- Payroll exports
- Technician field logs
- Laboratory reports
- Contract information
- Fixed price schedules
- Employee information

The extract step focuses on obtaining the source data in a consistent format before loading it into SQL.

---

# Transform

After the data has been loaded into the staging tables, it is reviewed and prepared for use by the warehouse.

Typical transformations include:

- Standardizing data types.
- Formatting dates.
- Removing unnecessary columns.
- Resolving inconsistent values.
- Creating business keys where required.
- Preparing data for loading into dimension and fact tables.

Version 1.0 intentionally keeps transformations simple so that the staging tables remain close to their original source data.

---

# Load

After the staging tables have been prepared, the warehouse tables are loaded.

The general loading order is:

1. Reference tables
2. Dimension tables
3. Bridge and mapping tables
4. Fact tables

Loading the warehouse in this order ensures that the relationships required by the fact tables already exist.

---

# Current ETL Process

Version 1.0 uses a repeatable SQL-based ETL process.

The typical workflow is:

```
Export Source Data
        │
        ▼
Review Source File
        │
        ▼
Import into SQL Staging Table
        │
        ▼
Run SQL Transformation Scripts
        │
        ▼
Load Dimension Tables
        │
        ▼
Load Fact Tables
        │
        ▼
Validate Results
```

Each source follows this same general pattern while applying business rules specific to that dataset.

---

# ETL Principles

The ETL process for Version 1.0 follows several guiding principles.

- Preserve the original source data.
- Keep staging tables close to the source.
- Apply business rules during transformation.
- Define table grain before loading facts.
- Validate results after every load.
- Build repeatable SQL scripts whenever possible.

These principles help maintain consistency across the warehouse as new data is added.

---

# Looking Ahead

The next chapter documents the warehouse tables in detail, including table definitions, grain, business keys, and relationships.
