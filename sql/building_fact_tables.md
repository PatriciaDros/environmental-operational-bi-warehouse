# Building a Fact Table

## A Repeatable ETL Template (Version 1)

This document describes the general workflow for building a fact table in the Environmental Operational BI Warehouse.

---

# ETL Philosophy

A fact table is built in two phases:

1. **Load the transactions**
2. **Enrich the transactions**

The first step creates the rows.

The remaining steps add business context to those rows.

Think of a fact row as telling a story. When it is first inserted, it only knows what came from the source system. Each UPDATE adds more information until the story is complete.

---

# Fact Table Build Template

## Step 1 — Start Fresh

Remove any existing data.

```sql
TRUNCATE TABLE fact_labor;
```

The table structure remains.

Only the rows are removed.

---

## Step 2 — Load the Transactions

Copy the source transactions into the fact table.

```text
Source System
(stg_payroll)
        │
        ▼
INSERT
        ▼
fact_labor
```

Example:

```sql
INSERT INTO fact_labor (...)
SELECT ...
FROM stg_payroll;
```

At this point:

- Every payroll transaction exists.
- No dimension data has been added.
- This is the raw transaction layer.

**Important:**

This is **not** a JOIN.

The rows do not yet exist in the fact table, so there is nothing to join to.

---

## Step 3 — Enrich from Dimension Tables

Once the rows exist, begin adding business information.

Example:

```text
fact_labor
      │
JOIN job_id
      │
dim_job
```

Update:

- Contract Number

---

Next:

```text
fact_labor
      │
JOIN legacy_emp_key
      │
dim_technician
```

Update:

- Employee Key
- SCA Job Title
- Years Experience

Each UPDATE adds additional business attributes.

No new rows are created.

---

## Step 4 — Build Derived Business Keys

Once all required columns exist, create any composite keys.

Example:

```text
contract_no
+
sca_job_title
+
yrs_exp
──────────────► map_sca_labor_key
```

Composite keys are often required to map facts to rate tables.

---

## Step 5 — Lookup Business Rules

Use the derived key to retrieve business information.

Example:

```text
map_sca_labor_key
        │
        ▼
dim_labor_sca_map
```

Populate:

- Labor Map Key
- SCA Labor Rate

---

## Step 6 — Calculate Business Metrics

Now calculate values that depend on the enriched data.

Examples:

- Labor Cost
- Labor Revenue
- Profit
- Margin

---

# INSERT vs UPDATE

## INSERT

Use INSERT when creating **new rows**.

Example:

A new payroll week arrives.

Those payroll transactions do not yet exist in the fact table.

Use:

```sql
INSERT INTO fact_labor
SELECT ...
FROM stg_payroll;
```

Think:

> INSERT = New transaction

---

## UPDATE

Use UPDATE when modifying **existing rows**.

Example:

The payroll rows already exist.

Now add:

- Contract Number
- Employee Key
- Job Title
- Years Experience
- Labor Rate

Think:

> UPDATE = Add business context to an existing transaction

---

# Mental Model

```text
Operational System (stg_payroll)
              │
              ▼
       INSERT INTO fact_labor
              │
              ▼
      Raw labor transaction
              │
              ├──────────────┐
              │              │
              ▼              ▼
      UPDATE from      UPDATE from
       dim_job       dim_technician
              │              │
              └──────┬───────┘
                     ▼
            Build business keys
                     │
                     ▼
           Lookup business rules
                     │
                     ▼
           Calculate metrics
                     │
                     ▼
          Completed Fact Table
```

---

# Important Principle

A JOIN is **not** an ETL step.

A JOIN is a tool used inside a SQL statement to match rows between tables.

Examples:

```sql
INSERT INTO ...
SELECT ...
FROM stg_payroll;
```

No JOIN.

```sql
UPDATE fact_labor
JOIN dim_job
...
```

JOIN used by an UPDATE.

```sql
SELECT ...
FROM fact_labor
JOIN dim_technician
...
```

JOIN used by a SELECT.

Always think about the SQL statement first.

The JOIN simply helps that statement find matching rows.

---

# Rule of Thumb

Ask yourself one question:

**Do the rows already exist in the destination table?**

If **No** → `INSERT`

If **Yes** → `UPDATE`

This simple question will guide most ETL development.
