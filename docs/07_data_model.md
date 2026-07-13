# Data Model

"How did the business become a relational database?"

## Why This Chapter Matters

The previous chapters described the business processes, warehouse architecture, and the movement of data through the warehouse.

This chapter explains how those business processes are represented as a relational database.

Rather than storing information in independent spreadsheets, the warehouse organizes related business information into tables that describe the people, places, things, and events that make up the business.

---

# Design Philosophy

The warehouse was not designed by copying existing Excel workbooks into SQL.

Each workbook had been created to solve a specific operational problem, but many of them contained information about the same jobs, employees, contracts, buildings, and laboratory work.

As the business processes became clearer, it also became clear that the same information was being used in many different places.

Instead of continuing to duplicate that information across multiple workbooks, the warehouse was designed to organize it into related tables so the information could be stored once and connected where needed.
---

# Warehouse Structure

Version 1.0 organizes the warehouse into three primary table types.

```
Staging Tables
       │
       ▼
Dimension Tables
       │
       ▼
 Fact Tables
```

Each table type serves a different purpose within the warehouse.

---

# Staging Tables

The staging tables store imported source data.

Each staging table closely reflects its original source with minimal transformation.

Their purpose is to:

- Preserve source data.
- Standardize data types.
- Prepare the data for loading into the warehouse.

The staging layer represents the operational systems, not the reporting model.

---

# Dimension Tables

Dimension tables describe the business entities used throughout the warehouse.

Examples include:

- Jobs
- Employees
- Buildings
- Contracts
- Labor Roles
- Laboratory Facilities
- Calendar Dates

Rather than repeating descriptive information throughout the database, it is stored once and referenced by the fact tables.

---

# Fact Tables

Fact tables record measurable business events.

Each fact table has a clearly defined grain that determines what a single record represents.

Examples include:

- Technician labor
- Laboratory activity
- Requests for payment

The fact tables combine measurements with the descriptive information stored in the dimension tables.

---

# Relationships

The warehouse is designed around the relationships between business entities rather than around individual spreadsheets.

Examples include:

- A contract may contain many work authorizations.
- A work authorization may generate one or more jobs.
- A job may involve multiple technicians.
- A job may generate multiple laboratory reports.
- A completed job may result in a request for payment.

These relationships allow information from different business processes to be connected into a single reporting model.

---

# Business Keys

The warehouse uses natural business identifiers to connect operational information across multiple business processes.

Examples include:

- Contract Number
- Work Authorization Number
- Job ID
- Building ID
- Employee Identifier

These business keys establish the relationships used throughout the warehouse.

Surrogate keys may be introduced where appropriate as the warehouse continues to evolve.

---

# Grain

One of the most important design decisions in the warehouse is defining the grain of each table.

The grain identifies exactly what one row represents.

Before any table is created, its grain must be clearly defined.

Version 1.0 documents the grain of every staging, dimension, and fact table separately within the Data Dictionary.

---

# Looking Ahead

The next chapter describes the Extract, Transform, and Load (ETL) processes used to move data from the operational source systems into the completed warehouse.
