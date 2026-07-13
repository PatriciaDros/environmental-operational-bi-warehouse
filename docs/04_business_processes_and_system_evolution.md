# Business Processes and System Evolution

## Why This Chapter Matters

The warehouse was not designed all at once.

It evolved over time as new business problems were identified and solved.

This chapter describes both the operational business processes and the evolution of the system that eventually became the Environmental Operational Business Intelligence Warehouse.

---

# The Evolution of the System

The warehouse began as a series of Excel workbooks created to solve individual operational problems.

As the business grew, so did the system.

---

## Phase 1 — Tracking Operational Information

The first goal was simply to organize information that the business needed every day.

Separate Excel workbooks were developed for different operational processes, including:

- Payroll Master
- Completion Checklist
- Lab Reports Received
- Monthly Status
- Job List

Each workbook solved a specific problem.

At this stage, the workbooks were viewed as independent tools.

---

## Phase 2 — Bringing the Information Together

As more workbooks were created, it became increasingly difficult to keep them synchronized.

The next step was to consolidate the operational workbooks into a single Excel workbook called **Master_Job_Finance_Model**.

Combining the information into one workbook made it easier to compare data across business processes and highlighted how much information was shared between them.

It became clear that nearly every workbook depended on the same core business identifiers, particularly the Work Authorization on the client side and the Job ID on the company's side.

---

## Phase 3 — Answering Business Questions

With the operational information consolidated, dashboards and summary reports were developed to answer the questions management asked most often.

Examples included:

- Has the job started?
- Is it in progress?
- Is it complete?
- Has it been billed?
- Has a Request for Payment been submitted?
- Has payment been received?

The focus shifted from collecting information to understanding the overall status of each project.

---

## Phase 4 — Discovering the Relationships

As reporting became more sophisticated, Excel increasingly became responsible for managing relationships between information stored in different worksheets.

Technician logs needed to be matched with laboratory reports.

Laboratory reports needed to be matched with jobs.

Jobs needed to be matched with Work Authorizations, contracts, and payroll.

As more business rules were incorporated into the system, the growing number of formulas and lookups made it clear that the information was no longer a collection of independent spreadsheets.

It had become a connected system that required defined relationships, consistent business rules, and a database designed to manage them.

During this stage, Excel was also used to model the future warehouse. Mapping the data helped identify business entities, relationships, bridge tables, mapping tables, and slowly changing dimensions before implementation began in SQL.

---

## Phase 5 — Building the SQL Warehouse

Once the relationships between the data had been identified, the warehouse moved into SQL.

The focus shifted from organizing spreadsheets to designing a relational database that accurately represented the business.

Version 1.0 represents the current stage of that evolution.

---

# Business Processes

Although the system evolved over time, the underlying business processes remained consistent.

The warehouse models the lifecycle of a project from contract through payment.

```
Contract
    ↓
Work Authorization
    ↓
Job
    ↓
Field Work
    ↓
Laboratory Analysis
    ↓
Project Documentation
    ↓
Final Report
    ↓
Request for Payment
    ↓
Payment Received
```

Every stage of this process contributes information to the warehouse and ultimately supports the business questions described in the previous chapter.
