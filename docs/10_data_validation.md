# Data Validation

## Why This Chapter Matters

Building a data warehouse is only part of the process. The data must also be validated to ensure it accurately reflects the operational information used by the business.

This chapter describes the validation approach used throughout Version 1.0.

---

# Validation Philosophy

Validation is performed throughout the warehouse development process rather than only after the warehouse has been completed.

As new tables are created and ETL processes are developed, the data is compared against the original operational sources to verify that the warehouse accurately represents the business.

The goal is to identify problems early and maintain confidence in the data.

---

# Validation Approach

Validation typically consists of comparing warehouse results with the original operational records.

Examples include:

- Comparing record counts.
- Verifying totals and subtotals.
- Confirming key relationships.
- Checking for duplicate records.
- Identifying missing records.
- Reconciling warehouse results with operational reports.

Where differences are found, the business process and ETL logic are reviewed before changes are made.

---

# Validation by Subject Area

Validation is performed for each major business process.

Examples include:

### Payroll

- Compare warehouse labor records to payroll exports.
- Verify employee hours.
- Verify Job IDs.
- Confirm labor totals.

### Laboratory Reporting

- Compare laboratory reports received with warehouse records.
- Verify sample quantities.
- Confirm laboratory facilities.

### Billing

- Verify Work Authorization information.
- Confirm Request for Payment records.
- Reconcile billing and payment status.

---

# Validation Queries

SQL validation queries are developed throughout the project to verify:

- Record counts
- Missing relationships
- Duplicate records
- Data quality issues
- Business rule compliance

These queries are maintained alongside the warehouse scripts and documentation.

---

# Current Status

Validation is performed incrementally as each warehouse component is completed.

Additional validation rules will continue to be added as Version 1.0 develops.
