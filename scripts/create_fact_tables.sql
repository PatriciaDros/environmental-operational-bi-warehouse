SHOW TABLES;

-- ============================================================================
-- Table: fact_labor
--
-- Source:
--   stg_payroll
--   dim_date
--   dim_job
--   dim_technician
--   dim_emp_rate_history
--   dim_contract
--   dim_labor_sca_map
--   dim_fixed_fees
--   dim_sca_rfp
--
-- Grain:
--   One employee working one job on one work date.
--
-- Purpose:
--   Stores labor transactions enriched with employee, project,
--   contract, billing, and profitability information. This table
--   serves as the primary fact table for labor cost, labor revenue,
--   and profitability analysis.
-- ============================================================================
CREATE TABLE fact_labor (
    labor_fact_key       INT AUTO_INCREMENT PRIMARY KEY,

    -- Payroll Transaction
    emp_key              INT,
    legacy_emp_key       VARCHAR(40),
    employee_name        VARCHAR(50),
    job_code             VARCHAR(2),
    hourly_rate          DECIMAL(10,2),
    date_worked          DATE,
    date_worked_key      INT,
    week_ending_date     DATE,
    week_ending_date_key INT,
    hours_worked         DECIMAL(6,2),
    job_id               VARCHAR(20),
    expenses             DECIMAL(10,2),

    -- Project Lookup
    contract_no          VARCHAR(20),

    -- Labor Lookup
    labor_title_exp_key  VARCHAR(75),
    sca_labor_key        VARCHAR(100),

    -- Billing
    home_multiplier      DECIMAL(5,2),
    sca_labor_rate       DECIMAL(10,2),
    fixed_report_fee     DECIMAL(10,2),
    actual_rfp_amount    DECIMAL(12,2),

    -- Measures
    cost                 DECIMAL(12,2),
    revenue              DECIMAL(12,2),
    profit               DECIMAL(12,2),
    margin               DECIMAL(8,4),

    load_date            DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: fact_lab
--
-- Source:
--   stg_lab_reports
--   dim_job
--   dim_lab_rates
--   dim_lab_sca_map
--   dim_lab_sca_rates
--
-- Grain:
--   One laboratory report line for one JobID, one sample type,
--   one laboratory, and one turnaround time.
--
-- Purpose:
--   Stores laboratory testing transactions enriched with vendor pricing,
--   SCA contractual reimbursement rates, and profitability calculations.
--   This table serves as the primary fact table for laboratory cost,
--   laboratory revenue, and laboratory profit analysis.
-- ============================================================================

CREATE TABLE fact_lab (
    lab_fact_key      INT AUTO_INCREMENT PRIMARY KEY,

    -- Laboratory Transaction
    job_id            VARCHAR(20),
    job_type          VARCHAR(10),
    sample            VARCHAR(30),
    sca_sample        VARCHAR(20),
    quantity          INT,
    tat               VARCHAR(20),
    facility          VARCHAR(20),

    -- Project Lookup
    contract_no       VARCHAR(20),

    -- Rate Lookups
    vendor_rate       DECIMAL(10,2),
    sca_rate          DECIMAL(10,2),

    -- Measures
    cost              DECIMAL(12,2),
    revenue           DECIMAL(12,2),
    profit            DECIMAL(12,2),

    -- ETL Lookup Keys
    map_key           VARCHAR(30),
    final_key         VARCHAR(50),
    vendor_rate_key   VARCHAR(50),
    jobid_labs        VARCHAR(30),

    load_date         DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: fact_job_summary
--
-- Source:
--   fact_labor
--   fact_lab
--   dim_sca_rfp
--
-- Grain:
--   One row per JobID.
--
-- Purpose:
--   Stores summarized labor, laboratory, and overall financial metrics
--   for each project. This table supports executive dashboards,
--   profitability reporting, and reconciliation against the actual
--   billed RFP amount submitted to the SCA.
-- ============================================================================

CREATE TABLE fact_job_summary (
    job_key             INT PRIMARY KEY,
    job_id              VARCHAR(20) NOT NULL UNIQUE,

    -- Labor Summary
    labor_revenue       DECIMAL(12,2),
    labor_cost          DECIMAL(12,2),
    labor_jobs_count    INT,
    labor_margin        DECIMAL(12,2),

    -- Laboratory Summary
    lab_revenue         DECIMAL(12,2),
    lab_cost            DECIMAL(12,2),
    lab_jobs_count      INT,
    lab_margin          DECIMAL(12,2),

    -- Overall Summary
    total_revenue       DECIMAL(12,2),
    total_cost          DECIMAL(12,2),
    total_profit        DECIMAL(12,2),
    profit_margin_pct   DECIMAL(8,4),

    -- Validation
    actual_rfp_amount   DECIMAL(12,2),

    load_date           DATETIME DEFAULT CURRENT_TIMESTAMP
);