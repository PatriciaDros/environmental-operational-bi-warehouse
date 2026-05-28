# Environmental Consulting Operational BI Warehouse Architecture

# 1. High-Level Warehouse Architecture

```text
RAW STAGING LAYER
-------------------------------------------------------------------------------------------------
stg_payroll
stg_lab_reports
stg_job_list
stg_sca_wa
stg_sca_rfp
stg_monthly_status
stg_emp_rate_transform
stg_contracts


DIMENSION LAYER
-------------------------------------------------------------------------------------------------
Dim_Date
Dim_Contract
Dim_Job
Dim_Employee
Dim_Job_Code
Dim_Emp_Rate_History
Dim_Labor_SCA_Map
Dim_Labor_SCA_Rates
Dim_Lab_Map
Dim_Lab_SCA_Rates
Dim_Lab_Vendor_Rates


TRANSACTION FACT LAYER
-------------------------------------------------------------------------------------------------
Fact_Labor
Fact_Lab
Fact_Billing


AGGREGATE / KPI LAYER
-------------------------------------------------------------------------------------------------
Fact_Job_Summary


PRESENTATION / SEMANTIC LAYER
-------------------------------------------------------------------------------------------------
Power BI
DAX Measures
KPIs
Executive Dashboards
Operational Dashboards
```

---

# 2. Complete Star Schema Relationship Diagram

```text

                                           +----------------+
                                           |   Dim_Date     |
                                           |----------------|
                                           | DateKey (PK)   |
                                           +----------------+
                                                   |
                         -----------------------------------------------------
                         |                        |                           |
                         v                        v                           v

+----------------+      +----------------+      +----------------+      +----------------------+
| Dim_Employee   |      | Dim_Job_Code   |      | Dim_Contract   |      | Dim_Emp_Rate_History|
|----------------|      |----------------|      |----------------|      |----------------------|
| EmployeeKey PK |      | JobCodeKey PK  |      | ContractKey PK |      | EmpRateKey PK       |
+----------------+      +----------------+      +----------------+      +----------------------+
         |                        |                       |                          |
         |                        |                       |                          |
         ---------------------------------------------------------------------------------
                                                   |
                                                   v

                                         +------------------+
                                         |   Fact_Labor     |
                                         |------------------|
                                         | LaborFactID PK   |
                                         | DateKey FK       |
                                         | JobKey FK        |
                                         | EmployeeKey FK   |
                                         | JobCodeKey FK    |
                                         | ContractKey FK   |
                                         | EmpRateKey FK    |
                                         +------------------+
                                                   |
                                                   |
                                                   v

                                           +----------------+
                                           |    Dim_Job     |
                                           |----------------|
                                           | JobKey PK      |
                                           | JobID          |
                                           +----------------+
                                                   |
             ---------------------------------------------------------------------------------
             |                               |                               |               |
             v                               v                               v               v

+----------------------+        +----------------------+       +----------------------+      +----------------------+
|     Fact_Lab         |        |    Fact_Billing     |       | Fact_Job_Summary    |      | Dim_Labor_SCA_Map  |
|----------------------|        |---------------------|       |----------------------|      |--------------------|
| LabFactID PK         |        | BillingFactID PK    |       | JobSummaryFactID PK |      | LaborSCAMapKey PK |
| DateKey FK           |        | JobKey FK           |       | JobKey FK           |      +--------------------+
| JobKey FK            |        | ContractKey FK      |       | ContractKey FK      |
| ContractKey FK       |        | RFP_No              |       | KPI Rollups         |
+----------------------+        +---------------------+       +----------------------+
             |
             |
             ------------------------------------------------------------------
                                  |                         |
                                  v                         v

                    +----------------------+    +----------------------+
                    |     Dim_Lab_Map      |    | Dim_Lab_SCA_Rates   |
                    |----------------------|    |----------------------|
                    | LabMapKey PK         |    | SCARateKey PK        |
                    +----------------------+    +----------------------+

                                  |
                                  v

                    +---------------------------+
                    | Dim_Lab_Vendor_Rates      |
                    |---------------------------|
                    | VendorRateKey PK          |
                    +---------------------------+
```

---

# 3. Detailed ETL / Data Flow Pipeline

## FACT_LABOR PIPELINE

```text
stg_payroll
    ->
lookup Dim_Date
    ->
lookup Dim_Job
    ->
lookup Dim_Employee
    ->
lookup Dim_Job_Code
    ->
lookup Dim_Contract
    ->
lookup Dim_Emp_Rate_History
    ->
lookup Dim_Labor_SCA_Map
    ->
calculate:
    Hours
    Pay_Rate
    Bill_Rate
    Labor_Cost
    Estimated_Labor_Revenue
    ->
load Fact_Labor
```

---

## FACT_LAB PIPELINE

```text
stg_lab_reports
    ->
lookup Dim_Date
    ->
lookup Dim_Job
    ->
lookup Dim_Contract
    ->
lookup Dim_Lab_Map
    ->
lookup Dim_Lab_SCA_Rates
    ->
lookup Dim_Lab_Vendor_Rates
    ->
calculate:
    Quantity
    Vendor_Cost
    Bill_Rate
    Total_Lab_Cost
    Estimated_Lab_Revenue
    Total_Lab_Profit
    ->
load Fact_Lab
```

---

## FACT_BILLING PIPELINE

```text
stg_sca_rfp
+
stg_monthly_status
    ->
merge billing + collections state
    ->
lookup Dim_Job
    ->
lookup Dim_Contract
    ->
lookup Dim_Date
    ->
calculate:
    Amount_Invoiced
    Amount_Received
    Outstanding_Balance
    ->
load Fact_Billing
```

---

## FACT_JOB_SUMMARY PIPELINE

```text
Fact_Labor
+
Fact_Lab
+
Fact_Billing
+
Dim_Job
+
Dim_Contract
    ->
aggregate by JobKey
    ->
calculate:
    Labor_Revenue
    Labor_Cost
    Lab_Revenue
    Lab_Cost
    Total_Revenue
    Total_Cost
    Total_Profit
    Has_Labor
    Has_Lab
    Has_Billing
    Is_Paid
    Is_Operationally_Complete
    Is_Financially_Complete
    ->
load Fact_Job_Summary
```

---

# 4. Fact Table Grains

| Table | Grain |
|---|---|
| Fact_Labor | One technician worked one labor role on one job on one date |
| Fact_Lab | One sample type processed for one job under one report/batch |
| Fact_Billing | One RFP/invoice for one JobID |
| Fact_Job_Summary | One current-state row per JobID |

---

# 5. Dimension Table Grains

| Dimension | Grain |
|---|---|
| Dim_Date | One row per calendar date |
| Dim_Contract | One row per contract |
| Dim_Job | One row per JobID |
| Dim_Employee | One row per employee |
| Dim_Job_Code | One row per labor classification |
| Dim_Emp_Rate_History | One row per employee rate period |
| Dim_Lab_Map | One row per mapped lab sample type/TAT |

---

# 6. Business Process Separation

| Business Process | Warehouse Table |
|---|---|
| Field labor operations | Fact_Labor |
| Laboratory processing | Fact_Lab |
| Billing & accounts receivable | Fact_Billing |
| Job profitability & KPI rollups | Fact_Job_Summary |

---

# 7. Key Architectural Concepts Demonstrated

This warehouse demonstrates:

- Dimensional modeling
- Star schema architecture
- Operational BI design
- Late-arriving fact handling
- Aggregate snapshot fact tables
- Accounts receivable lifecycle modeling
- Contract-driven reimbursement logic
- Historical rate management
- Semantic KPI layering
- Conformed dimensions
- Current-state operational reporting
- Enterprise-style ETL layering

---

# 8. Recommended Power BI Semantic Model

## Primary Slicer Dimensions

- Dim_Job
- Dim_Contract
- Dim_Date
- Dim_Employee

## Recommended KPI Measures

### Financial KPIs

- Profit Margin %
- Collection Rate
- Outstanding AR
- Revenue by Contract
- Revenue by Job Type

### Operational KPIs

- Jobs Awaiting Billing
- Jobs Missing Labor
- Jobs Missing Lab
- Operational Completion Rate
- Financial Completion Rate

### Workforce KPIs

- Revenue per Technician
- Labor Utilization
- Avg Labor Cost per Job

---

# 9. Final Warehouse Philosophy

The warehouse is intentionally designed around:

- clean business process separation
- JobID-centered reconciliation
- stable KPI rollups
- current-state operational reporting
- asynchronous operational event handling
- dimensional modeling best practices

The architecture prioritizes:

- clarity
- maintainability
- reconciliation trust
- operational usability
- scalable BI design

rather than unnecessary enterprise complexity.

