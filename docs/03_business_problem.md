# Business Problem

What operational problems needed to be solved?

## Why This Chapter Matters

Before designing a database, it is important to understand the business problems it was intended to solve.

This chapter describes the operational challenges that existed before the warehouse was developed and explains why the existing processes were becoming increasingly difficult to manage.

---

# Business Context

The company performs environmental consulting services for public and private construction projects.

Each project generates information from many different sources throughout its lifecycle. Technician labor, laboratory testing, project documentation, payroll, billing, and payment tracking all contribute to the completion of a job.

Although each process produced valuable information, no single system brought everything together.

---

# The Challenge

Preparing a completed project for billing required gathering information from numerous operational sources.

These included:

- Technician field logs
- Laboratory reports
- Payroll records
- Project documentation
- Work authorizations
- Contract information
- Licensing records
- Internal tracking workbooks
- Downloads provided by the company's public agency client

Each source answered only part of the overall business process.

Understanding the complete status of a project required manually connecting information from all of these sources.

---

# Operational Challenges

Several recurring problems affected day-to-day operations.

Examples included:

- Information scattered across multiple workbooks and documents.
- Duplicate data entered into multiple systems.
- Difficulty determining whether a project was complete.
- Technician logs and laboratory reports arriving at different times.
- Payroll information requiring manual verification.
- Supporting documentation needing to be reconciled before billing.
- Repeated lookups across multiple spreadsheets.

As the volume of work increased, maintaining these relationships manually became increasingly difficult.

---

# Business Questions

Management frequently needed answers to questions such as:

- Is this job ready to be submitted for payment?
- If not, what is still missing?
- Did a technician work on a particular day?
- Were the reported hours submitted correctly?
- Have all laboratory reports been received?
- Has all required project documentation been collected?
- Has the Request for Payment been submitted?
- Has payment been received?

Answering these questions often required searching through multiple spreadsheets, reports, and paper records before a reliable answer could be given.

---

# Summary

The business problems were not caused by a lack of information.

The challenge was that the information existed in many different places and had to be manually connected before meaningful business questions could be answered.

The next chapter describes how those operational problems were gradually solved and how the warehouse evolved from a collection of Excel workbooks into a relational SQL database.
