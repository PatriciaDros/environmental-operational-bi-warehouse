# Reporting

## Why This Chapter Matters

The purpose of the warehouse is to answer business questions by bringing together information from multiple operational sources.

Although Version 1.0 focuses on building the warehouse itself, the database has been designed to support operational reporting.

---

# Reporting Philosophy

The warehouse was developed to answer real business questions rather than produce reports for their own sake.

Throughout the project, the design of the database has been driven by the information management needed to make operational decisions.

---

# Business Questions

Examples of questions the warehouse is designed to answer include:

- Is a job ready to be submitted for payment?
- If not, what information is still missing?
- Which technicians worked on a specific job?
- How many hours were worked?
- Have all laboratory reports been received?
- Has the Final Report been completed?
- Has a Request for Payment been submitted?
- Has payment been received?

---

# Current Reporting

Version 1.0 currently supports reporting through SQL queries.

These queries provide operational information by combining data from multiple staging, dimension, and fact tables.

As additional warehouse components are completed, reporting capabilities will continue to expand.

---

# Future Reporting Opportunities

The completed warehouse provides a foundation for future reporting, including:

- Operational dashboards.
- Project status reporting.
- Payroll reporting.
- Laboratory reporting.
- Billing and payment tracking.
- Executive summary reporting.

The reporting layer will build upon the warehouse documented throughout this repository.
