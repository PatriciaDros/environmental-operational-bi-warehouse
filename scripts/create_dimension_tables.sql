SHOW TABLES;
DESCRIBE dim_date;

-- ============================================================================
-- Table: dim_date
--
-- Source:
--   Generated using a recursive CTE.
--
-- Grain:
--   One row per calendar date.
--
-- Purpose:
--   Calendar dimension used throughout the warehouse for date-based
--   reporting, filtering, grouping, and historical analysis. Provides
--   standardized date attributes for all fact tables.
-- ============================================================================

CREATE TABLE dim_date (
    date_key           INT PRIMARY KEY,
    full_date          DATE NOT NULL,
    day_name           VARCHAR(10) NOT NULL,
    month_name         VARCHAR(20) NOT NULL,
    quarter            TINYINT NOT NULL,
    calendar_year      SMALLINT NOT NULL,
    week_ending_date   DATE NOT NULL,
    is_weekday         BOOLEAN NOT NULL,
    load_date          DATETIME DEFAULT CURRENT_TIMESTAMP
);

SET SESSION cte_max_recursion_depth = 5000;

INSERT INTO dim_date
(
    date_key,
    full_date,
    day_name,
    month_name,
    quarter,
    calendar_year,
    week_ending_date,
    is_weekday
)

WITH RECURSIVE dates AS
(
    SELECT DATE('2019-01-01') AS dt
    UNION ALL
    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM dates
    WHERE dt < '2030-12-31'
)

SELECT
    DATE_FORMAT(dt,'%Y%m%d') + 0,
    dt,
    DAYNAME(dt),
    MONTHNAME(dt),
    QUARTER(dt),
    YEAR(dt),
    DATE_ADD(
        dt,
        INTERVAL (6 - WEEKDAY(dt)) DAY
    ),

    CASE
        WHEN WEEKDAY(dt) < 5 THEN TRUE
        ELSE FALSE
    END

FROM dates;

SELECT COUNT(*) AS total_dates
FROM dim_date;

-- ============================================================================
-- Table: dim_technician
--
-- Source:
--   stg_employees
--   stg_emp_rate_history
--   dim_labor_title
--
-- Grain:
--   One technician per job classification and experience tier.
--
-- Purpose:
--   Stores technician attributes required for labor analysis, including
--   operational job code, SCA labor title, experience tier, and the
--   legacy employee key used to associate technicians with historical
--   pay rate records.
-- ============================================================================

CREATE TABLE dim_technician (
    emp_id_key         INT AUTO_INCREMENT PRIMARY KEY,
    employee_name      VARCHAR(50) NOT NULL,
    first_name         VARCHAR(25) NOT NULL,
    last_name          VARCHAR(25) NOT NULL,
    job_code           VARCHAR(2) NOT NULL,
    sca_job_title      VARCHAR(50) NOT NULL,
    yrs_exp            TINYINT NOT NULL,
    legacy_emp_key     VARCHAR(40) NOT NULL
);

-- ============================================================================
-- Table: dim_job
--
-- Source:
--   stg_job_list
--   stg_sca_wa
--   stg_monthly_status
--
-- Grain:
--   One row per JobID.
--
-- Purpose:
--   Stores project-level attributes for each environmental consulting
--   job, including contract assignment, work authorization, service
--   information, project status, and key dates. Serves as the central
--   project dimension for labor, laboratory, and profitability analysis.
-- ============================================================================

CREATE TABLE dim_job (
    job_key               INT AUTO_INCREMENT PRIMARY KEY,
    job_id                VARCHAR(20) NOT NULL UNIQUE,
    building_id           VARCHAR(10) NOT NULL,
    project_description   VARCHAR(100),
    service_id            INT,
    wa_no                 INT,
    project_id            VARCHAR(20),
    contract_no           VARCHAR(20),
    initiation_date_key   INT,
    job_status            VARCHAR(20),
    wa_status             VARCHAR(50),
    load_date             DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_labor_title
--
-- Source:
--   stg_labor_codes
--
-- Grain:
--   One row per SAI labor code.
--
-- Purpose:
--   Stores SAI labor classifications and descriptive job titles used
--   throughout the warehouse. Provides a standardized mapping from
--   operational job codes to labor categories and titles used during
--   employee, labor rate, and fact table transformations.
-- ============================================================================

CREATE TABLE dim_labor_title (
    labor_title_key   INT AUTO_INCREMENT PRIMARY KEY,
    job_code          VARCHAR(2) NOT NULL UNIQUE,
    job_category      VARCHAR(25) NOT NULL,
    job_title         VARCHAR(50) NOT NULL,
    full_job_title    VARCHAR(75) NOT NULL,
    code_years_exp    VARCHAR(80),
    load_date         DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_sca_rfp
--
-- Source:
--   stg_monthly_status
--   stg_sca_rfp
--
-- Grain:
--   One row per JobID / RFP.
--
-- Purpose:
--   Stores SCA Request for Proposal (RFP) information associated with
--   each project, including contract assignment, billing status,
--   approved RFP amount, and project completion information.
-- ============================================================================

CREATE TABLE dim_sca_rfp (
    job_key             INT,
    job_id              VARCHAR(20) NOT NULL UNIQUE,
    service_id          INT,
    contract_no         VARCHAR(20),
    sai_rfp_no          INT,
    rfp_amount          DECIMAL(12,2),
    date_job_complete   DATE,
    rfp_date            DATE,
    billing_status      VARCHAR(30),
    load_date           DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_emp_rate_history
--
-- Source:
--   stg_emp_rate_history
--
-- Grain:
--   One employee pay rate period.
--
-- Purpose:
--   Stores the historical hourly pay rates for each technician.
--   Each record represents the effective pay rate for a technician
--   during a specific date range and is used to determine labor cost
--   based on the work date recorded in Fact_Labor.
-- ============================================================================

CREATE TABLE dim_emp_rate_history (
    emp_rate_key     INT AUTO_INCREMENT PRIMARY KEY,
    legacy_emp_key   VARCHAR(40) NOT NULL,
    start_date       DATE NOT NULL,
    start_date_key   INT NOT NULL,
    end_date         DATE NOT NULL,
    end_date_key     INT NOT NULL,
    hourly_rate      DECIMAL(10,2) NOT NULL,
    load_date        DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_sca_labor_rate
--
-- Source:
--   stg_sca_labor_rates
--
-- Grain:
--   One contract, labor title, and experience tier.
--
-- Purpose:
--   Stores the contractual SCA labor rates for each labor title,
--   contract, and experience tier. Used to determine the allowable
--   billable labor rates when calculating labor revenue.
-- ============================================================================

CREATE TABLE dim_sca_labor_rate (
    sca_labor_key             INT AUTO_INCREMENT PRIMARY KEY,
    contract_no               VARCHAR(20) NOT NULL,
    title_code                VARCHAR(15) NOT NULL,
    sca_title_description     VARCHAR(75) NOT NULL,
    category                  VARCHAR(25),
    job_title                 VARCHAR(50) NOT NULL,
    sca_job_title_key         VARCHAR(100) NOT NULL,
    level                     VARCHAR(2),
    years_experience          TINYINT NOT NULL,
    max_billable_hourly_rate  DECIMAL(10,2),
    max_loaded_home_rate      DECIMAL(10,2),
    max_loaded_field_rate     DECIMAL(10,2),
    load_date                 DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_labor_sca_map
--
-- Source:
--   dim_labor_title
--   dim_sca_labor_rate
--
-- Grain:
--   One contract, labor title, and experience tier.
--
-- Purpose:
--   Maps SAI labor classifications to the corresponding SCA contractual
--   labor rate for a given contract and experience tier. This dimension
--   bridges operational labor data with contractual billing rates used
--   to calculate labor revenue.
-- ============================================================================

CREATE TABLE dim_labor_sca_map (
    labor_map_key         INT AUTO_INCREMENT PRIMARY KEY,
    category              VARCHAR(25),
    title                 VARCHAR(50),
    years_experience      TINYINT,
    map_sca_labor_key     VARCHAR(100) NOT NULL,
    sca_labor_rate_lookup DECIMAL(10,2),
    max_load_field_hourly DECIMAL(10,2),
    actual_bill_rate      DECIMAL(10,2),
    contract_no           VARCHAR(20),
    load_date             DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_lab_rates
--
-- Source:
--   Laboratory Rate Schedule
--
-- Grain:
--   One laboratory, sample type, and turnaround time.
--
-- Purpose:
--   Stores laboratory vendor pricing by facility, sample type, and
--   turnaround time. Used to determine laboratory costs for each
--   laboratory report imported into the warehouse.
-- ============================================================================

CREATE TABLE dim_lab_rates (
    lab_rate_key      INT AUTO_INCREMENT PRIMARY KEY,
    facility_sample   VARCHAR(50) NOT NULL,
    facility          VARCHAR(20) NOT NULL,
    sample            VARCHAR(30) NOT NULL,
    tat               VARCHAR(20) NOT NULL,
    rate              DECIMAL(10,2) NOT NULL,
    load_date         DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_lab_sca_rates
--
-- Source:
--   stg_sca_lab_rates
--
-- Grain:
--   One contract, laboratory test, and turnaround time.
--
-- Purpose:
--   Stores the contractual laboratory reimbursement rates defined by
--   the SCA for each contract, laboratory test, and turnaround time.
--   Used to calculate laboratory revenue and compare contractual
--   reimbursement against actual laboratory costs.
-- ============================================================================

CREATE TABLE dim_lab_sca_rates (
    sca_lab_rate_key    INT AUTO_INCREMENT PRIMARY KEY,
    contract_no         VARCHAR(20) NOT NULL,
    test_code           VARCHAR(20) NOT NULL,
    sca_lab_key         VARCHAR(50) NOT NULL,
    sample_type         VARCHAR(20) NOT NULL,
    test_description    VARCHAR(100),
    tatime              VARCHAR(20) NOT NULL,
    test_rate           DECIMAL(10,2) NOT NULL,
    check_duplicates    VARCHAR(75),
    load_date           DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_lab_sca_map
--
-- Source:
--   dim_lab_rates
--   dim_lab_sca_rates
--
-- Grain:
--   One vendor sample type, contract, and turnaround time.
--
-- Purpose:
--   Maps laboratory vendor sample names to the corresponding SCA
--   laboratory reimbursement category for a specific contract and
--   turnaround time. Bridges laboratory costs with contractual
--   reimbursement rates used to calculate laboratory revenue.
-- ============================================================================

CREATE TABLE dim_lab_sca_map (
    lab_map_key         INT AUTO_INCREMENT PRIMARY KEY,
    map_key             VARCHAR(30) NOT NULL,
    sca_sample_name     VARCHAR(20) NOT NULL,
    vendor_sample_name  VARCHAR(30) NOT NULL,
    tat                 VARCHAR(20) NOT NULL,
    sca_rate_lookup     DECIMAL(10,2),
    contract_no         VARCHAR(20) NOT NULL,
    final_key           VARCHAR(50) NOT NULL,
    load_date           DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- Table: dim_fixed_fees
--
-- Source:
--   Curated Portfolio Dataset
--
-- Grain:
--   One row per JobID.
--
-- Purpose:
--   Stores fixed report fees associated with each project. These fees
--   represent contracted reimbursement amounts for reports that are
--   billed independently of labor and laboratory activity.
-- ============================================================================

CREATE TABLE dim_fixed_fees (
    job_key          INT PRIMARY KEY,
    job_id           VARCHAR(20) NOT NULL UNIQUE,
    report_fee       DECIMAL(10,2) NOT NULL,
    load_date        DATETIME DEFAULT CURRENT_TIMESTAMP
);

