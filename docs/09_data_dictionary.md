# Data Dictionary

## Why This Chapter Matters

The data dictionary provides the reference documentation for the warehouse.

Rather than describing the business processes, this chapter documents the structure of the database, including the purpose of each table, the grain of the data, business keys, relationships, and column definitions.

The detailed reference documents are maintained separately to make them easier to update as the warehouse evolves.

---

# Overview

The warehouse is organized into three primary table types:

- Staging Tables
- Dimension Tables
- Fact Tables

Each table has a defined business purpose, a clearly documented grain, and relationships to other tables within the warehouse.

Understanding these definitions is essential for maintaining the warehouse and writing accurate SQL queries.

---

# Staging Tables

The staging tables represent the operational source data imported into the warehouse.

Each staging table closely reflects its original source with minimal transformation.

The staging table documentation includes:

- Business purpose
- Grain
- Primary business key
- Source system

For detailed staging table definitions, see:

- `docs/data_dictionary/staging_table_grains.md`

---

# Dimension Tables

Dimension tables describe the people, places, things, and classifications used throughout the warehouse.

Examples include employees, jobs, contracts, buildings, laboratories, and labor roles.

The dimension table documentation includes:

- Business purpose
- Grain
- Primary business key
- Surrogate keys (where applicable)
- Slowly Changing Dimension strategy (where applicable)

For detailed dimension definitions, see:

- `docs/data_dictionary/dimension_table_grains.md`

---

# Fact Tables

Fact tables record measurable business events.

Each fact table has a clearly defined grain before any SQL is written.

The fact table documentation includes:

- Business purpose
- Grain
- Measures
- Foreign keys
- Related dimensions

For detailed fact definitions, see:

- `docs/data_dictionary/fact_table_grains.md`

---

# Table Relationships

The relationships between tables are documented separately.

This documentation identifies:

- Parent-child relationships
- Business keys
- Foreign key relationships
- Bridge tables
- Mapping tables

For relationship documentation, see:

- `docs/data_dictionary/table_relationships.md`

---

# Column Definitions

Detailed column definitions are maintained separately from the table documentation.

The column dictionary includes:

- Column name
- Data type
- Description
- Business meaning
- Source (where applicable)

For detailed column definitions, see:

- `docs/data_dictionary/column_dictionary.md`

---

# Maintaining the Data Dictionary

As Version 1.0 continues to evolve, the data dictionary should be updated whenever:

- A table is added.
- A column is added or removed.
- Table grain changes.
- Business rules change.
- Relationships are modified.

Maintaining accurate reference documentation is an important part of maintaining the warehouse itself.
