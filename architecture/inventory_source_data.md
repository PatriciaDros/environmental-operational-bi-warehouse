# Inventory the five sources

We now temporarily forget about `fact_labor`, `fact_lab`, etc.

We're asking a very basic question:

> **What does each table actually contain, and what job-level information can I get from it?**

Given only:

* `stg_payroll`
* `stg_lab_reports`
* `stg_job_list`
* `stg_sca_rates`
* `stg_emp_rate_history`

I'd inventory them like this:

| Source                 | Question I'm asking                                                             |
| ---------------------- | ------------------------------------------------------------------------------- |
| `stg_payroll`          | What labor was performed, by whom, when, on what job, and what did we pay them? |
| `stg_lab_reports`      | What laboratory work was performed for each job?                                |
| `stg_job_list`         | What identifies a job and connects it to other business information?            |
| `stg_sca_rates`        | What could we bill SCA for the labor performed?                                 |
| `stg_emp_rate_history` | What was each employee's actual labor cost during the period?                   |

### But I would go one level deeper.

For each table, I want to establish **four things**:

1. **Grain** — What does one row represent?
2. **Keys** — How can I identify and connect the row?
3. **Measures** — What numbers can I calculate from it?
4. **Relationships** — What other tables can it connect to?

For example:

### `stg_payroll`

I'd inspect it and determine something like:

```text
Grain:
One employee + one job + one day + one labor code

Keys:
Employee
JobID
Date Worked

Measures:
Hours Worked
Hourly Rate
Expenses

Potential calculations:
Labor Cost
```

Then:

### `stg_emp_rate_history`

```text
Grain:
One employee + one rate period

Keys:
Employee
Rate Start Date
Rate End Date

Measures:
Hourly Rate

Purpose:
Determine the employee's actual cost
for the date they worked.
```

Then:

### `stg_sca_rates`

```text
Grain:
One contract + one job title + one experience tier

Keys:
Contract
Job Title
Years Experience

Measure:
SCA Billable Rate

Purpose:
Determine labor revenue.
```

And so on.

---

## The important thing we're looking for

We're trying to discover the **join path**.

For labor, it might turn out to be:

```text
PAYROLL
   │
   │ Employee + Date
   ▼
EMP RATE HISTORY
   │
   │ actual pay rate
   ▼
LABOR COST


PAYROLL
   │
   │ Job
   ▼
JOB LIST
   │
   │ Contract
   ▼
SCA RATES
   │
   │ Job Title + Experience
   ▼
LABOR REVENUE
```

That tells us something extremely important:

**The tables don't need to have the final answer in them.**

They need to contain enough information to **derive** the answer and enough keys to **connect** the information correctly.

---

### So Step 2's deliverable is not a fact table.

It's essentially this:

> **Source → Grain → Keys → Measures → Relationships → Business purpose**

Once we've done that for all five tables, **then** we can move to Step 3: determining what dimensions/lookups we actually need.

And that's where things start getting interesting.
