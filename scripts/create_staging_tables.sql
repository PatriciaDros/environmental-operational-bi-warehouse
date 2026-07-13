 
USE environmental_dw_portfolio;
SHOW TABLES;

-- ============================================================================
-- Table: stg_sca_wa
--
-- Source:
--   SCA Work Authorization (WA) Export
--
-- Grain:
--   One Work Authorization record per service.
--
-- Purpose:
--   Stores raw Work Authorization data imported from the SCA export prior to
--   ETL processing. Data in this table closely mirrors the source file and is
--   intentionally not normalized.
-- ============================================================================

CREATE TABLE stg_sca_wa (

    building_id               VARCHAR(5),
    building_name             VARCHAR(100),
    building_address          VARCHAR(100),

    project_id                VARCHAR(10),
    project_name              VARCHAR(100),
    project_type              VARCHAR(20),

    service_id                INT,
    service_name              VARCHAR(100),
    service_initiation_date   DATE,

    priority                  VARCHAR(20),
    primary_hygienist         VARCHAR(50),

    contract_no               VARCHAR(20),

    wa_number                 INT,
    wa_type                   VARCHAR(50),

    date_wa_issued            DATE,
    wa_status                 VARCHAR(100),
    status_date               DATE,
    expected_due_date         DATE,

    original_wa_amt           DECIMAL(10,2),
    current_approved_amt      DECIMAL(10,2),
    proposed_amendment_amt    DECIMAL(10,2),
    current_wa_total          DECIMAL(10,2),

    load_date                 DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- ============================================================================
-- Table: stg_contract_values
--
-- Source:
--   SCA Contract Values Export
--
-- Grain:
--   One record per contract.
--
-- Purpose:
--   Stores raw contract information including effective dates,
--   billing multipliers, and contract value prior to ETL.
-- ============================================================================

CREATE TABLE stg_contract_values (

    contract_no          VARCHAR(20),
    contract_status      VARCHAR(25),

    execution_date       DATE,
    expiration_date      DATE,

    home_multiplier      DECIMAL(5,2),
    field_multiplier     DECIMAL(5,2),

    contract_value       DECIMAL(12,2),

    load_date            DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- ============================================================================
-- Table: stg_sca_fixed_prices
--
-- Source:
--   SCA Fixed Price Schedule Export
--
-- Grain:
--   One record per contract and work type.
--
-- Purpose:
--   Stores contracted fixed-price billing rates for report types and other
--   billable work performed under SCA contracts prior to ETL processing.
-- ============================================================================

CREATE TABLE stg_sca_fixed_prices (
    contract_no            VARCHAR(20),
    work_type_code         VARCHAR(10),
    work_type_description  VARCHAR(100),
    fixed_price            DECIMAL(10,2),
    status_date            DATE,
    load_date              DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_job_list
--
-- Source:
--   Job List Workbook
--
-- Grain:
--   One row per JobID.
--
-- Purpose:
--   Stores the master list of projects maintained by the company.
--   Each record represents a unique JobID and provides the core project
--   information used to build the job dimension. This table serves as
--   the primary source for project identifiers and is joined with other
--   operational staging tables to enrich projects with contract,
--   building, work authorization, and billing information.
-- ============================================================================

CREATE TABLE stg_job_list (
    job_id VARCHAR(20),
    building_id VARCHAR(10),
    job_description VARCHAR(100),
    service_id INT,
    project_id VARCHAR(20),
    contract_no VARCHAR(20),
    sai_job_status VARCHAR(20),
    load_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_payroll
--
-- Source:
--   Payroll Master Workbook
--
-- Grain:
--   One employee working one job on one work date.
--
-- Purpose:
--   Stores payroll transactions exported from the operational payroll
--   workbook. Each record represents an individual employee's work
--   performed on a specific job and work date, including hours worked,
--   hourly rate, and job-related expenses. This table serves as the
--   primary source for building employee dimensions, historical pay
--   rates, and the fact_labor table.
-- ============================================================================

CREATE TABLE stg_payroll (
    employee_name      VARCHAR(50),
    job_code           VARCHAR(5),
    hourly_rate        DECIMAL(10,2),
    date_paid          DATE,
    date_worked        DATE,
    week_ending_date   DATE,
    hours_worked       DECIMAL(6,2),
    job_id             VARCHAR(20),
    building_id        VARCHAR(10),
    expenses           DECIMAL(10,2),
    job_type           VARCHAR(10),
    legacy_empkey      VARCHAR(50),
    load_date          DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_employees
--
-- Source:
--   Employee Master List
--
-- Grain:
--   One record per employee.
--
-- Purpose:
--   Stores the current employee roster imported from the operational employee
--   list. Used as the source for Dim_Employee and employee-related lookups.
-- ============================================================================

CREATE TABLE stg_employees (
    last_name        VARCHAR(20),
    first_name       VARCHAR(20),
    full_name        VARCHAR(40),
    employee_id      VARCHAR(10),
    employee_type    VARCHAR(15),
    is_active        BOOLEAN,
    load_date        DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_labor_codes
--
-- Source:
--   Internal Labor Code Reference
--
-- Grain:
--   One record per labor code.
--
-- Purpose:
--   Stores the operational labor codes and corresponding job titles used
--   throughout payroll processing and project billing. These codes are used
--   to classify labor transactions and map employees to their operational
--   job functions.
-- ============================================================================

CREATE TABLE stg_labor_codes (
    job_code         VARCHAR(2),
    job_title        VARCHAR(50),
    load_date        DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_emp_rate_history
--
-- Source:
--   Derived from payroll history
--
-- Grain:
--   One employee, one job code, one pay rate, one SCA experience tier,
--   for one effective date range.
--
-- Purpose:
--   Stores historical employee pay rates derived from payroll transactions.
--   Because the operational system did not maintain historical rate records,
--   this table preserves effective-date pay history, job classifications,
--   and SCA experience tiers used to calculate historical labor costs and
--   contract reimbursement.
-- ============================================================================

CREATE TABLE stg_emp_rate_history (
    legacy_emp_key        VARCHAR(40),
    employee_name         VARCHAR(50),
    job_code              VARCHAR(2),
    job_title             VARCHAR(50),
    sca_experience_tier   TINYINT,
    rate_start_date       DATE,
    rate_end_date         DATE,
    hourly_rate           DECIMAL(10,2),
    load_date             DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================================
-- Table: stg_monthly_status
--
-- Source:
--   Monthly Status Workbook
--
-- Grain:
--   One project (JobID) status record.
--
-- Purpose:
--   Stores operational project status, billing activity, work
--   authorization information, RFP information, invoicing, payments,
--   and collections. Serves as the primary staging table for project
--   financial reconciliation and profitability reporting.
-- ============================================================================

CREATE TABLE stg_monthly_status (
    job_id                  VARCHAR(20),
    contract_no             VARCHAR(20),
    building_id             VARCHAR(10),
    school_name             VARCHAR(100),
    wa_no                   INT,
    service_id              VARCHAR(10),
    project_type            VARCHAR(30),
    primary_hygienist       VARCHAR(50),
    service_name            VARCHAR(75),
    wa_type                 VARCHAR(50),
    wa_status               VARCHAR(50),
    initiation_date         DATE,
    wa_estimate_cost        DECIMAL(12,2),
    actual_start_date       DATE,
    actual_completion_date  DATE,
    rfp_no                  VARCHAR(20),
    rfp_date                DATE,
    amount_invoiced         DECIMAL(12,2),
    amount_received         DECIMAL(12,2),
    amount_outstanding      DECIMAL(12,2),
    check_no                VARCHAR(20),
    check_date              DATE,
    payment_received_date   DATE,
    billing_status          VARCHAR(30),
    load_date               DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_sca_rfp
--
-- Source:
--   SCA Request for Proposal (RFP) Export
--
-- Grain:
--   One RFP record.
--
-- Purpose:
--   Stores RFP information exported from the SCA system, including
--   project identifiers, work authorizations, contract information,
--   project status, and RFP lifecycle status. Used to reconcile
--   operational project activity with contract and billing records.
-- ============================================================================

CREATE TABLE stg_sca_rfp (
    building_id          VARCHAR(10),
    project_id           VARCHAR(20),
    project_description  VARCHAR(100),
    service_id           INT,
    service_name         VARCHAR(75),
    initiation_date      DATE,
    primary_hygienist    VARCHAR(50),
    wa_number            INT,
    contract_no          VARCHAR(20),
    rfp_no               VARCHAR(20),
    is_final             BOOLEAN,
    rfp_status           VARCHAR(50),
    rfp_status_date      DATE,
    erfp_status          VARCHAR(50),
    erfp_status_date     DATE,
    load_date            DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: stg_lab_reports
--
-- Source:
--   Laboratory Reports Workbook
--
-- Grain:
--   One laboratory report line item.
--
-- Purpose:
--   Stores laboratory testing activity imported from the operational
--   laboratory workbook. These records are used to calculate laboratory
--   costs, laboratory revenue, and project profitability.
-- ============================================================================

CREATE TABLE stg_lab_reports (
    building_id        VARCHAR(10),
    job_id             VARCHAR(20),
    report_date        DATE,
    report_id          VARCHAR(20),
    sample_type        VARCHAR(30),
    quantity           INT,
    technician         VARCHAR(50),
    facility           VARCHAR(50),
    rate               DECIMAL(10,2),
    load_date          DATETIME DEFAULT CURRENT_TIMESTAMP
);