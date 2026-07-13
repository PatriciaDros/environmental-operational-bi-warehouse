# Business Problem

## Why This Chapter Matters

Before designing a database, it is important to understand the business problems it was built to solve.

This chapter describes the operational challenges that led to the development of the Environmental Operational Business Intelligence Warehouse and explains why a collection of independent spreadsheets eventually evolved into a centralized SQL database.

---

# Business Context

The company provides environmental consulting services for public and private construction projects.

Each completed project requires technical reports, laboratory analysis, technician payroll, supporting documentation, and billing before payment can be requested.

Although each part of the business produced valuable information, that information was created and maintained in many different places.

No single system provided a complete view of a project from the time work was authorized until payment was received.

---

# The Challenge

Preparing a completed project for billing required gathering information from numerous operational sources.

These included:

- Technician field logs
- Laboratory reports
- Work authorizations
- Project reports
- Payroll records
- Contractor documentation
- Licensing records
- Internal tracking workbooks
- Downloads provided by the company's public agency client

Each source answered only part of the overall business process.

Understanding the complete status of a project required manually connecting information across all of these sources.

---

# The Questions the Business Needed Answered

The business needed reliable answers to questions such as:

- Is this job ready to be submitted for payment?
- If not, what is still missing?
- Did every technician submit their project log?
- Were all technician hours entered correctly?
- Were the correct hours submitted to payroll?
- Have all laboratory reports been received?
- Does the project documentation match the work that was performed?
- Has the job been billed?
- Has payment been received?

These questions affected project completion, payroll, billing, cash flow, and ultimately the company's financial performance.

---

# The Operational Reality

No single system answered these questions.

Instead, information had to be collected from multiple documents, spreadsheets, reports, and handwritten records before a reliable answer could be given.

As the company completed more projects, maintaining these relationships manually became increasingly difficult.

The same information was often recorded multiple times in different places, increasing the risk of inconsistent data, missing information, and reporting errors.

---

# The First Solutions

The initial goal was not to build a database.

The first goal was to solve individual operational problems.

Excel workbooks were created to:

- Track required project documentation.
- Record technician labor.
- Monitor laboratory reports.
- Reduce payroll reporting errors.
- Track billing activity.
- Improve the accuracy of Final Reports.
- Answer recurring operational questions more efficiently.

Each workbook solved a specific business problem.

Over time, however, the workbooks became increasingly connected because they were describing different parts of the same business process.

---

# From Operational Tools to a Data Warehouse

As new operational questions arose, additional tracking systems were developed.

Eventually it became clear that the workbooks were no longer independent tools.

They had become an interconnected operational reporting system.

The Environmental Operational Business Intelligence Warehouse was created to organize those relationships within a centralized SQL database, allowing information to be connected through common business entities rather than maintained separately across numerous spreadsheets.

Rather than replacing the business processes, the warehouse was designed to model them.

The result is a structured operational reporting system that reflects how the business actually works.
