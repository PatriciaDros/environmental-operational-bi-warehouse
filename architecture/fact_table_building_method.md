can you put the following in markdown as is...



# Fact Table Building Method

**Project:** Environmental Operational Business Intelligence Warehouse
**Version:** 1.0
**Status:** Working Architecture Note

---

# Starting Point

Assume the only data available is a workbook containing the following staging tables:

- `stg_payroll`
- `stg_lab_reports`
- `stg_job_list`
- `stg_sca_rates`
- `stg_emp_rate_history`

No completed fact tables exist yet.

---

# Business Question

> **What is the profit margin per job?**

The goal is to determine, for each `JobID`:

- Labor Cost
- Laboratory Cost
- Revenue
- Profit
- Profit Margin

At a basic level:

```text
Profit = Revenue - Cost

Profit Margin = Profit / Revenue

The formulas are simple.
```

The difficult part is determining **where each number comes from and what business rules determine it.**

---

# Do Not Start by Building the Fact Table

The first step is **not** to create `fact_labor`.

Before building a fact table, the available data must be evaluated to determine whether the business question can actually be answered from the available sources.

The process is:

```
```

```
Business Question
        ↓
Define the calculation
        ↓
Inventory the available data
        ↓
Identify the grain of each source
        ↓
Identify the required data
        ↓
Identify relationships between sources
        ↓
Identify business rules
        ↓
Identify missing data or relationships
        ↓
Create source-to-target mappings
        ↓
Design the fact tables and stars
        ↓
Build the fact tables
        ↓
Validate
        ↓
Report
```

---

# 1. Define What Must Be Calculated

The business question is:

> What is the profit margin per job?

Break this into its components.

```
```

```
Profit Margin
      │
      ├── Revenue
      │
      └── Cost
```

Cost may include:

```
```

```
Labor Cost
+
Laboratory Cost
```

Revenue may include:

```
```

```
Labor Revenue
+
Laboratory / Fixed-Price Revenue
```

These assumptions must be verified against the available data and business rules.

---

# 2. Inventory the Available Data

Before designing the facts, identify what each source can provide.

| Business NeedCandidate SourceQuestions to Answer |                                        |                                                             |
| ------------------------------------------------ | -------------------------------------- | ----------------------------------------------------------- |
| Job                                              | `stg_job_list`                         | Is `JobID` unique? What other identifiers describe the job? |
| Labor hours                                      | `stg_payroll`                          | What is the grain? Are the hours complete?                  |
| Employee                                         | `stg_payroll` / `stg_emp_rate_history` | How is the employee identified consistently?                |
| Labor cost                                       | `stg_payroll`                          | Is the payroll rate the actual cost rate?                   |
| Labor revenue                                    | `stg_sca_rates` + payroll              | What determines the applicable billing rate?                |
| Contract                                         | `stg_job_list`                         | Can one job have multiple contracts?                        |
| Employee experience                              | `stg_emp_rate_history`                 | Which experience tier applies to the labor event?           |
| Job title                                        | payroll / employee / rate data         | Which title applies to the labor event?                     |
| Laboratory activity                              | `stg_lab_reports`                      | What does one row represent?                                |
| Laboratory cost                                  | `stg_lab_reports`                      | Is `rate` the actual vendor cost?                           |
| Laboratory revenue                               | Available sources                      | Is the information required to calculate revenue available? |
| Fixed-price revenue                              | `stg_sca_rates` or other source        | What identifies the applicable work type and price?         |

The purpose of this step is to distinguish between:

**Data we have**

and

**Data we need.**

---

# 3. Identify the Grain of Each Source

Before joining tables, determine what one row represents in each source.

For example:

## `stg_payroll`

Potential grain:

> One employee, one job, one day, one labor code, at a particular pay rate.

This must be confirmed against the actual source data.

## `stg_lab_reports`

The grain must be determined from the source.

A row may represent:

-  a laboratory report 
-  a report/batch 
-  a sample type 
-  another combination of laboratory activity 

The grain should not be assumed simply because the table is called `stg_lab_reports`.

## `stg_sca_rates`

Determine what makes one rate different from another.

For labor, the applicable rate may depend on:

```
```

```
Contract
+
Job Title
+
Years Experience
```

This is a business rule, not merely a SQL join.

---

# 4. Identify Relationships

Once the grains are understood, determine how the sources relate.

For example:

```
```

```
stg_payroll
     │
     │ JobID
     ▼
stg_job_list
```

Potentially:

```
```

```
stg_payroll
     │
     │ Employee + Date / applicable period
     ▼
stg_emp_rate_history
```

And potentially:

```
```

```
Payroll Labor
     │
     ├── Contract
     ├── Job Title
     └── Years Experience
             │
             ▼
       stg_sca_rates
```

The purpose of this step is to determine whether the required information can actually be connected.

---

# 5. Identify Business Rules

The warehouse cannot rely on column names alone.

The business rules that determine the numbers must be documented.

For example:

## Labor Revenue

The applicable SCA labor rate may require:

```
```

```
Contract
+
Job Title
+
Years Experience
        ↓
SCA Labor Rate
```

Then:

```
```

```
Labor Revenue =
Hours Worked × Applicable SCA Labor Rate
```

## Labor Cost

Potentially:

```
```

```
Labor Cost =
Hours Worked × Applicable Employee Pay Rate
```

The applicable employee rate may depend on the employee and the date worked.

## Fixed-Price Revenue

A laboratory or report-related charge may depend on:

```
```

```
Contract
+
Work Type
        ↓
Fixed Price
```

The exact rule must be established before the fact is built.

---

# 6. Identify Missing Data

The analysis may reveal that the available sources are not sufficient to answer the business question.

For example:

```
```

```
Labor Cost
    ↓
Available

Labor Revenue
    ↓
Possibly available

Laboratory Cost
    ↓
Available

Laboratory Revenue
    ↓
May require additional data
```

A missing relationship, mapping table, or source is an architectural finding.

It is not a reason to force a questionable join.

---

# 7. Create Source-to-Target Mappings

Once the requirements and business rules are understood, define how each fact column will be populated.

For example:

## `fact_labor`

| Fact ColumnSourceRule / Transformation |                             |                               |
| -------------------------------------- | --------------------------- | ----------------------------- |
| `JobID`                                | `stg_payroll`               | Direct                        |
| Employee                               | `stg_payroll`               | Employee mapping              |
| Date Worked                            | `stg_payroll`               | Direct                        |
| Hours Worked                           | `stg_payroll`               | Direct                        |
| Pay Rate                               | payroll / rate history      | Determine applicable rate     |
| Labor Cost                             | calculated                  | Hours × Pay Rate              |
| Contract                               | job / contract relationship | Determine applicable contract |
| Job Title                              | labor/employee data         | Determine applicable title    |
| Years Experience                       | employee rate history       | Determine applicable tier     |
| SCA Labor Rate                         | `stg_sca_rates`             | Contract + Title + Experience |
| Labor Revenue                          | calculated                  | Hours × SCA Labor Rate        |

This mapping becomes the specification for the SQL.

---

# 8. Design the Star Schema

Only after the previous steps are understood should the star schema be finalized.

For example:

```
```

```
                    dim_employee
                         │
                         ▼
dim_date ───────────► fact_labor ◄────────── dim_job
                         ▲
                         │
                    dim_job_code
```

The center is the **fact table** because it represents the business event being measured.

For `fact_labor`:

> One employee + one job + one day.

The dimensions describe the labor event.

The fact table contains the keys and measures associated with that event.

---

# 9. Build the Fact Table

Once the source-to-target mapping and business rules are established, the SQL can be written.

Conceptually:

```
```

```
stg_payroll
     │
     ├── Employee information
     ├── Job information
     ├── Date information
     ├── Labor role
     └── Rate logic
              │
              ▼
         fact_labor
```

The SQL joins are implementing the relationships and business rules that were established during the analysis.

The joins are not the architecture by themselves.

---

# 10. Validate the Fact

After the fact is built, verify that it represents the intended grain.

For example:

```
```

```
Declared grain:

One employee
+
One job
+
One day
```

Then check:

-  Are rows duplicated? 
-  Did source rows disappear? 
-  Are employees unmatched? 
-  Are jobs unmatched? 
-  Are rates missing? 
-  Are rates incorrect? 
-  Do hours reconcile to payroll? 
-  Do calculated costs reconcile to the expected values? 

The fact should not be considered complete until the results are validated.

---

# 11. Repeat for the Other Facts

The same process applies to each business event.

```
```

```
Business Question
       ↓
Requirements
       ↓
Source Analysis
       ↓
Business Rules
       ↓
Source-to-Target Mapping
       ↓
Star Design
       ↓
Build
       ↓
Validate
```

## `fact_labor`

Business event:

> Technician labor performed.

## `fact_lab`

Business event:

> Laboratory activity associated with a job.

## `fact_billing`

Business event:

> RFP / billing activity associated with a job.

## `fact_job_summary`

Business event:

> Job-level financial summary.

Grain:

> One row per `JobID`.

---

# The Important Lesson

The star schema is **not the first step after identifying the business question.**

The star schema is the result of understanding:

-  what the business wants to know 
-  what data is available 
-  what one row represents 
-  how the sources relate 
-  what business rules determine the numbers 
-  what information is missing 
-  how each required value will be calculated 

The process is therefore:

```
```

```
                BUSINESS QUESTION
                       │
                       ▼
             What must be calculated?
                       │
                       ▼
                What data do we have?
                       │
                       ▼
                 What is the grain?
                       │
                       ▼
              How are sources related?
                       │
                       ▼
               What are the rules?
                       │
                       ▼
                What are we missing?
                       │
                       ▼
             Source-to-Target Mapping
                       │
                       ▼
                 Star Schema
                       │
                       ▼
                 Fact Table
                       │
                       ▼
                  Validation
                       │
                       ▼
                   Reporting
```

> **The SQL comes after we understand what the SQL is supposed to accomplish.**

For this project, understanding the business rules behind the numbers is part of building the warehouse—not a separate activity that happens afterward.

#
