A **source-to-target mapping** is basically a translation table that says:

> **“Where does each piece of data come from, and where does it go?”**

It's used when you're moving/transforming data from source systems into a database, warehouse, report, etc.

### In your project

Suppose you want to build `fact_labor`.

You might have:

| Source                                 | Source Column            | Transformation / Rule | Target       | Target Column    |
| -------------------------------------- | ------------------------ | --------------------- | ------------ | ---------------- |
| `stg_payroll`                          | `Employee_Name`          | Direct                | `fact_labor` | `Employee_Name`  |
| `stg_payroll`                          | `JobID`                  | Direct                | `fact_labor` | `JobID`          |
| `stg_payroll`                          | `Hours_Worked`           | Direct                | `fact_labor` | `Hours_Worked`   |
| `stg_payroll`                          | `Hourly_Rate`            | Lookup employee rate  | `fact_labor` | `Pay_Rate`       |
| `stg_payroll`                          | `Date_Worked`            | Direct                | `fact_labor` | `Date_Worked`    |
| `stg_payroll` + `stg_emp_rate_history` | —                        | `Hours × Pay Rate`    | `fact_labor` | `Labor_Cost`     |
| `stg_payroll` + `stg_sca_rates`        | —                        | Lookup SCA rate       | `fact_labor` | `SCA_Labor_Rate` |
| `fact_labor`                           | `Labor_Cost`             | —                     | `fact_labor` | `Labor_Cost`     |
| `fact_labor`                           | `SCA_Labor_Rate × Hours` | —                     | `fact_labor` | `Labor_Revenue`  |

That's a **source-to-target mapping**.

### Think of it like a recipe

```text
SOURCE DATA
     ↓
"What do I have?"
     ↓
TRANSFORMATION
"What do I do to it?"
     ↓
TARGET
"Where does it end up?"
```

For example:

```text
stg_payroll.Hours_Worked ──────────────► fact_labor.Hours_Worked
                                          
stg_payroll.Employee_Name ──┐
                             ├─ lookup ──► fact_labor.Pay_Rate
stg_emp_rate_history.Rate ───┘

Hours_Worked × Pay_Rate ───────────────► fact_labor.Labor_Cost
```

### Why it's useful

It forces you to answer **exactly how the warehouse gets built**.

Without a mapping, you might say:

> "We'll get labor cost from payroll."

A mapping makes you say:

> "`Hours_Worked` comes from `stg_payroll`, `Pay_Rate` comes from `stg_emp_rate_history` based on employee and date, and `Labor_Cost` is calculated as Hours × Pay Rate."

That's much more precise.

And this connects directly to what we're doing right now: **Step 2 (inventorying the sources) gives us the information we need to eventually create the source-to-target mapping.**
