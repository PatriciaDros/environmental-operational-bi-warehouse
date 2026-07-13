# Business Processes

## Why This Chapter Matters

The warehouse was designed to support the day-to-day operations of an environmental consulting company.

Before describing the database design, it is important to understand the business processes the warehouse models.

Each process contributes information about a project as it moves from authorization through completion, billing, and payment.

---

# Overview

Every project follows a series of operational steps.

Different departments, employees, contractors, laboratories, and clients contribute information throughout the life of a project.

The warehouse brings these separate activities together so they can be viewed as one connected business process.

---

# Project Lifecycle

The simplified project lifecycle is shown below.

```
Contract
    ↓
Work Authorization
    ↓
Job Number Assigned
    ↓
Field Work Performed
    ↓
Laboratory Samples Processed
    ↓
Project Documentation Completed
    ↓
Final Report Prepared
    ↓
Request for Payment Submitted
    ↓
Payment Received
```

Each stage produces information that becomes part of the warehouse.

---

# Business Process 1 — Contract Management

Projects begin under an active contract.

The contract establishes the pricing, billing rules, and reimbursement schedules that apply to the work performed.

The warehouse stores contract information so labor, laboratory work, and billing can be associated with the correct contract.

---

# Business Process 2 — Work Authorization

A work authorization formally assigns work to be performed.

Each work authorization identifies the project, location, and services requested.

This information establishes the starting point for a new job.

---

# Business Process 3 — Job Management

Once work has been authorized, an internal Job ID is assigned.

The Job ID becomes the primary operational identifier used throughout the business.

It connects payroll, laboratory reports, project documentation, billing, and payment activities.

---

# Business Process 4 — Field Operations

Technicians perform field work and record their activities in handwritten project log books.

These logs document:

- Dates worked
- Hours worked
- Job performed
- Job location
- Labor classification

The information is later entered into the operational tracking system and payroll.

---

# Business Process 5 — Laboratory Processing

Environmental samples collected during field work are submitted to laboratories for analysis.

Laboratory reports are received over time and recorded as they become available.

Each report contributes to the completion of the project and ultimately becomes part of the Final Report.

---

# Business Process 6 — Project Documentation

As work progresses, supporting documentation is collected and reviewed.

Examples include:

- Investigation reports
- Reoccupancy letters
- Laboratory reports
- Technician certifications
- Company licenses
- Required project documentation

A project cannot be considered complete until all required documentation has been received.

---

# Business Process 7 — Payroll

Technician labor is reviewed and entered into payroll.

The business must be able to determine:

- Who worked
- When they worked
- What job they worked on
- Their labor classification
- Hours worked

Accurate payroll information is also required for billing and reimbursement.

---

# Business Process 8 — Billing

Once all required documentation has been collected, the project can be submitted for payment.

A Request for Payment (RFP) is submitted to the client.

The submission records the billing event for the completed work.

---

# Business Process 9 — Payment Tracking

After an RFP has been submitted, payment activity is tracked until the project has been paid.

This includes recording payment status, payment dates, and related financial information.

---

# Bringing the Processes Together

Although these business processes are performed at different times and often by different people, they all describe the same project.

The purpose of the warehouse is to organize these relationships into a single reporting system so operational questions can be answered using connected data rather than independent spreadsheets.

The chapters that follow describe how these business processes are translated into the warehouse architecture, database design, and ETL processes.
