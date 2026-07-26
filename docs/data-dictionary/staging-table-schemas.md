# Staging Tables

> Last Updated: 2026-07-25

---

# Overview

The staging layer contains raw or lightly cleaned data imported from source systems. These tables are refreshed from source files and act as the landing zone before data is transformed into dimension and fact tables.

---

## stg_sca_wa

**Purpose**

Work Authorizations downloaded from SCA. Each row represents a Work Authorization (WA) for a project.

**Source**

SCA Work Authorization Export

**Primary Business Key**

`wa_number`

| Column                  | Data Type     |
| ----------------------- | ------------- |
| building_id             | varchar(5)    |
| building_name           | varchar(100)  |
| building_address        | varchar(100)  |
| project_id              | varchar(10)   |
| project_name            | varchar(100)  |
| project_type            | varchar(20)   |
| service_id              | int           |
| service_name            | varchar(100)  |
| service_initiation_date | date          |
| priority                | varchar(20)   |
| primary_hygienist       | varchar(50)   |
| contract_no             | varchar(20)   |
| wa_number               | int           |
| wa_type                 | varchar(50)   |
| date_wa_issued          | date          |
| wa_status               | varchar(100)  |
| status_date             | date          |
| original_wa_amt         | decimal(10,2) |
| current_approved_amt    | decimal(10,2) |
| proposed_amendment_amt  | decimal(10,2) |
| current_wa_total        | decimal(10,2) |
| load_date               | datetime      |

---

## stg_sca_rfp

**Purpose**

Requests for Payment downloaded from SCA. These represent invoices submitted but not yet paid.

**Source**

SCA RFP Export

**Primary Business Key**

`rfp_no`

| Column              | Data Type    |
| ------------------- | ------------ |
| building_id         | varchar(10)  |
| project_id          | varchar(20)  |
| project_description | varchar(100) |
| service_id          | int          |
| service_name        | varchar(75)  |
| initiation_date     | date         |
| primary_hygienist   | varchar(50)  |
| wa_number           | int          |
| contract_no         | varchar(20)  |
| rfp_no              | int          |
| is_final            | tinyint(1)   |
| rfp_status          | varchar(50)  |
| rfp_status_date     | date         |
| erfp_status         | varchar(50)  |
| erfp_status_date    | date         |
| load_date           | datetime     |

---

## stg_sca_fixed_prices

**Purpose**

Contracted fixed prices paid by SCA for reports and regulatory documents.

**Source**

SCA Fixed Price Schedule

**Primary Business Key**

`contract_no + work_type_code`

| Column                | Data Type     |
| --------------------- | ------------- |
| contract_no           | varchar(20)   |
| work_type_code        | varchar(10)   |
| work_type_description | varchar(100)  |
| fixed_price           | decimal(10,2) |
| status_date           | date          |
| load_date             | datetime      |

---

## stg_payroll

**Purpose**

Payroll records created from the company payroll system. Each row represents one employee working on one job on one day.

**Source**

Payroll Database

**Primary Business Key**

`legacy_emp_key + job_id + date_worked`

| Column           | Data Type     |
| ---------------- | ------------- |
| employee_name    | varchar(50)   |
| job_code         | varchar(5)    |
| hourly_rate      | decimal(10,2) |
| date_paid        | date          |
| date_worked      | date          |
| week_ending_date | date          |
| hours_worked     | decimal(6,2)  |
| job_id           | varchar(20)   |
| building_id      | varchar(10)   |
| expenses         | decimal(10,2) |
| job_type         | varchar(10)   |
| legacy_empkey    | varchar(50)   |
| load_date        | datetime      |

---

## stg_monthly_status

**Purpose**

Management report showing the current status of jobs, billing, and payments.

**Source**

Internal Monthly Status Report

**Primary Business Key**

`job_id`

_(Columns omitted here for brevity—add/update as needed.)_

---

## stg_lab_reports

**Purpose**

Laboratory testing records. Each row represents a laboratory report or sample batch.

**Source**

Lab Reports Received Database

**Primary Business Key**

`batch_no`

| Column      | Data Type   |
| ----------- | ----------- |
| client_type | varchar(20) |
| building_id | varchar(10) |
| job_id      | varchar(20) |
| report_date | date        |
| batch_no    | varchar(20) |
| sample_type | varchar(30) |
| quantity    | int         |
| technician  | varchar(50) |
| facility    | varchar(30) |
| load_date   | datetime    |

---

## stg_job_list

**Purpose**

Maps SCA projects to internal SAI Job IDs.

**Source**

Internal Job List

**Primary Business Key**

`job_id`

| Column          | Data Type    |
| --------------- | ------------ |
| job_id          | varchar(20)  |
| building_id     | varchar(10)  |
| job_description | varchar(100) |
| service_id      | int          |
| project_id      | varchar(20)  |
| contract_no     | varchar(20)  |
| sai_job_status  | varchar(20)  |
| load_date       | datetime     |

---

## stg_emp_rate_history

**Purpose**

Historical employee pay rates.

**Source**

Payroll History

**Primary Business Key**

`legacy_emp_key + rate_start_date`

| Column              | Data Type     |
| ------------------- | ------------- |
| legacy_emp_key      | varchar(40)   |
| employee_name       | varchar(50)   |
| job_code            | varchar(2)    |
| job_title           | varchar(50)   |
| sca_experience_tier | tinyint       |
| rate_start_date     | date          |
| rate_end_date       | date          |
| hourly_rate         | decimal(10,2) |
| load_date           | datetime      |

---

## stg_contract_values

**Purpose**

Contract-level financial information including multipliers and contract value.

**Source**

Contract Administration

**Primary Business Key**

`contract_no`

| Column           | Data Type     |
| ---------------- | ------------- |
| contract_no      | varchar(20)   |
| contract_status  | varchar(25)   |
| execution_date   | date          |
| expiration_date  | date          |
| home_multiplier  | decimal(5,2)  |
| field_multiplier | decimal(5,2)  |
| contract_value   | decimal(12,2) |
| load_date        | datetime      |

---

# Maintenance Notes

When a table changes:

- Update the Purpose (if necessary)
- Add/remove columns
- Update data types
- Update the business key (if changed)
- Update the "Last Updated" date

This document is intended to be the authoritative reference for the staging layer.
