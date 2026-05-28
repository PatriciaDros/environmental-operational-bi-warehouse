# Enterprise BI KPI & Executive Metric Design

# Overview

This KPI framework is designed for the Environmental Consulting Operational BI Warehouse.

The warehouse supports:

- operational labor tracking
- laboratory operations
- billing lifecycle monitoring
- accounts receivable tracking
- profitability analytics
- contract reimbursement analysis
- job-level operational completeness

The KPI layer is divided into:

1. Executive Financial KPIs
2. Operational Workflow KPIs
3. Billing & AR KPIs
4. Labor Performance KPIs
5. Laboratory Performance KPIs
6. Contract Performance KPIs
7. Data Quality & Reconciliation KPIs

---

# 1. EXECUTIVE FINANCIAL KPIs

These KPIs are intended for:

- ownership
- executives
- finance leadership
- operations leadership

---

## Total Revenue

### Business Meaning
Total billed revenue across all jobs.

### Formula

```sql
SUM(Fact_Job_Summary.Total_Revenue)
```

### Source

- Fact_Job_Summary

---

## Total Cost

### Business Meaning
Combined labor and lab operational cost.

### Formula

```sql
SUM(Fact_Job_Summary.Total_Cost)
```

---

## Total Profit

### Business Meaning
Revenue minus total operational cost.

### Formula

```sql
SUM(Fact_Job_Summary.Total_Profit)
```

---

## Gross Profit Margin %

### Business Meaning
Percentage of revenue retained after operational costs.

### Formula

```sql
SUM(Total_Profit)
/
SUM(Total_Revenue)
```

### IMPORTANT
This should be calculated dynamically in Power BI/DAX.

---

## Outstanding Accounts Receivable

### Business Meaning
Current unpaid invoice balance.

### Formula

```sql
SUM(Fact_Job_Summary.Outstanding_Balance)
```

---

## Collection Rate %

### Business Meaning
Percentage of invoiced revenue successfully collected.

### Formula

```sql
SUM(Amount_Received)
/
SUM(Amount_Invoiced)
```

---

## Revenue by Contract

### Business Meaning
Revenue generated under each SCA contract.

### Dimensions

- Contract_No
- Contract Expiration
- Contract Value

---

## Profitability by Contract

### Business Meaning
Most profitable and least profitable contracts.

### Formula

```sql
SUM(Total_Profit)
GROUP BY Contract_No
```

---

# 2. OPERATIONAL WORKFLOW KPIs

These KPIs monitor operational completeness and workflow maturity.

---

## Jobs Awaiting Billing

### Business Meaning
Jobs where operational work exists but no billing has occurred.

### Formula

```sql
Has_Labor = 1
AND Has_Billing = 0
```

---

## Jobs Awaiting Lab Reports

### Business Meaning
Jobs where labor exists but lab reports are not yet available.

### Formula

```sql
Has_Labor = 1
AND Has_Lab = 0
```

---

## Jobs Awaiting Labor Submission

### Business Meaning
Lab activity exists but technician payroll/timesheets are missing.

### Formula

```sql
Has_Lab = 1
AND Has_Labor = 0
```

---

## Operational Completion Rate

### Business Meaning
Percentage of jobs operationally complete.

### Formula

```sql
SUM(Is_Operationally_Complete)
/
COUNT(JobID)
```

---

## Financial Completion Rate

### Business Meaning
Percentage of jobs fully paid.

### Formula

```sql
SUM(Is_Financially_Complete)
/
COUNT(JobID)
```

---

## Active Jobs

### Business Meaning
Jobs currently open/active.

### Formula

```sql
Is_Active = 1
```

---

## Jobs by Billing Status

### Dimensions

- NOT BILLED
- UNPAID
- PAID
- PARTIAL

---

# 3. BILLING & ACCOUNTS RECEIVABLE KPIs

These KPIs support:

- accounting
- AR monitoring
- collections tracking
- billing operations

---

## Total Amount Invoiced

### Formula

```sql
SUM(Fact_Billing.Amount_Invoiced)
```

---

## Total Amount Received

### Formula

```sql
SUM(Fact_Billing.Amount_Received)
```

---

## Total Outstanding Balance

### Formula

```sql
SUM(Fact_Billing.Outstanding_Balance)
```

---

## Average Days to Payment

### Business Meaning
Average collection time.

### Formula

```sql
DATEDIFF(RFP_Date, Check_Received_Date)
```

Average across all paid jobs.

---

## Unpaid Jobs by Aging Bucket

### Aging Categories

- 0–30 Days
- 31–60 Days
- 61–90 Days
- 90+ Days

### Business Meaning
Accounts receivable aging analysis.

---

## Billing Volume by Month

### Formula

```sql
SUM(Amount_Invoiced)
GROUP BY Month
```

---

## Payment Volume by Month

### Formula

```sql
SUM(Amount_Received)
GROUP BY Month
```

---

## Final RFP Percentage

### Business Meaning
Percentage of RFPs marked final.

### Formula

```sql
SUM(Is_Final_RFP)
/
COUNT(RFP_No)
```

---

# 4. LABOR PERFORMANCE KPIs

These KPIs evaluate field operations and technician productivity.

---

## Total Labor Hours

### Formula

```sql
SUM(Fact_Labor.Hours)
```

---

## Labor Revenue

### Formula

```sql
SUM(Fact_Labor.Estimated_Labor_Revenue)
```

---

## Labor Cost

### Formula

```sql
SUM(Fact_Labor.Labor_Cost)
```

---

## Labor Profit

### Formula

```sql
SUM(Estimated_Labor_Revenue)
-
SUM(Labor_Cost)
```

---

## Labor Margin %

### Formula

```sql
SUM(Labor Profit)
/
SUM(Labor Revenue)
```

---

## Revenue per Technician

### Formula

```sql
SUM(Estimated_Labor_Revenue)
/
DISTINCTCOUNT(EmployeeKey)
```

---

## Utilization by Technician

### Business Meaning
Hours worked by technician.

### Formula

```sql
SUM(Hours)
GROUP BY Employee
```

---

## Revenue by Labor Classification

### Dimensions

- Investigator
- Project Monitor
- CIH
- Air Sampling Technician

---

## Labor Revenue by Job Type

### Dimensions

- SCA
- DOE
- NYCHA
- Private

---

# 5. LABORATORY PERFORMANCE KPIs

These KPIs monitor lab operational efficiency and profitability.

---

## Total Samples Processed

### Formula

```sql
SUM(Fact_Lab.Quantity)
```

---

## Lab Revenue

### Formula

```sql
SUM(Fact_Lab.Estimated_Lab_Revenue)
```

---

## Lab Cost

### Formula

```sql
SUM(Fact_Lab.Total_Lab_Cost)
```

---

## Lab Profit

### Formula

```sql
SUM(Estimated_Lab_Revenue)
-
SUM(Total_Lab_Cost)
```

---

## Lab Margin %

### Formula

```sql
SUM(Lab Profit)
/
SUM(Lab Revenue)
```

---

## Samples by Type

### Dimensions

- PCM
- TEM
- Background
- Pre
- During
- Final

---

## Revenue by Sample Type

### Formula

```sql
SUM(Estimated_Lab_Revenue)
GROUP BY Sample_Bridge
```

---

## Vendor Cost by Facility

### Formula

```sql
SUM(Total_Lab_Cost)
GROUP BY Facility
```

---

## Turnaround Time Distribution

### Dimensions

- Same Day
- 1 Hour
- 4 Hour
- 24 Hour

---

# 6. CONTRACT PERFORMANCE KPIs

These KPIs analyze SCA contract profitability and utilization.

---

## Revenue by Contract

### Formula

```sql
SUM(Total_Revenue)
GROUP BY Contract_No
```

---

## Profit by Contract

### Formula

```sql
SUM(Total_Profit)
GROUP BY Contract_No
```

---

## Contract Utilization %

### Business Meaning
Revenue earned relative to total contract value.

### Formula

```sql
SUM(Total_Revenue)
/
Contract_Value
```

---

## Revenue by Contract Expiration Window

### Categories

- Expiring in 30 days
- Expiring in 90 days
- Expiring in 6 months

---

## Contract Margin Comparison

### Business Meaning
Compare profitability across contracts.

---

# 7. DATA QUALITY & RECONCILIATION KPIs

These KPIs are EXTREMELY important for operational trust.

---

## Jobs Missing Labor

### Formula

```sql
Has_Lab = 1
AND Has_Labor = 0
```

---

## Jobs Missing Lab

### Formula

```sql
Has_Labor = 1
AND Has_Lab = 0
```

---

## Jobs Missing Billing

### Formula

```sql
Has_Labor = 1
AND Has_Billing = 0
```

---

## Revenue vs Invoice Variance

### Business Meaning
Difference between estimated operational revenue and actual invoiced revenue.

### Formula

```sql
Estimated Revenue
-
Amount_Invoiced
```

---

## Negative Margin Jobs

### Business Meaning
Jobs where operational costs exceed revenue.

### Formula

```sql
Total_Profit < 0
```

---

## High Outstanding Balance Jobs

### Formula

```sql
Outstanding_Balance > threshold
```

---

## Jobs Without Contract Mapping

### Business Meaning
Jobs missing contract assignment.

---

## Duplicate Labor Detection

### Formula

Potential duplicate logic:

```sql
DateKey + EmployeeKey + JobKey + Hours
```

---

# POWER BI RECOMMENDATIONS

# Primary Slicer Dimensions

| Dimension |
|---|
| JobID |
| Contract_No |
| Billing_Status |
| Job_Type |
| Employee |
| Project_Type |
| Date |

---

# Recommended Dashboard Pages

## Executive Summary

- Total Revenue
- Total Profit
- Gross Margin %
- Outstanding AR
- Collection Rate
- Active Jobs

---

## Operations Dashboard

- Jobs Awaiting Billing
- Missing Labor
- Missing Lab
- Operational Completion

---

## Billing & AR Dashboard

- Outstanding Balance
- Aging Buckets
- Invoice Trends
- Payment Trends
- Unpaid Jobs

---

## Labor Analytics Dashboard

- Technician Revenue
- Utilization
- Labor Margin
- Revenue by Classification

---

## Laboratory Analytics Dashboard

- Sample Volume
- Revenue by Sample Type
- Vendor Cost Analysis
- TAT Analysis

---

## Contract Anal