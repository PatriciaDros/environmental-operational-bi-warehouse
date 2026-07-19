SHOW TABLES;
DESCRIBE fact_labor;
SELECT * FROM fact_labor;
DESCRIBE dim_labor_sca_map;

/*=====================================================================
  FACT TABLE: fact_labor
-----------------------------------------------------------------------
Purpose:
    Stores one labor transaction for one employee working one job
    on one date.

Business Grain:
    One row per employee, per job, per date worked.

Primary Key:
    labor_fact_key

Primary Data Source:
    - stg_payroll
        • Employee
        • Hours Worked
        • Hourly Rate
        • Job ID
        • Date Worked
        • Expenses

Used By:
    - Labor Reporting
    - Job Profitability
    - Payroll Analysis

Business Purpose:
    Serves as the foundation for labor cost and labor revenue
    calculations.

ETL Strategy:
    1. Load payroll transactions from stg_payroll.
    2. Add information from dimensions.
    3. Calculate cost, revenue, profit, and margin.

=====================================================================*/

INSERT INTO fact_labor
(
    legacy_emp_key,
    employee_name,
    job_code,
    hourly_rate,
    date_worked,
    week_ending_date,
    hours_worked,
    job_id,
    expenses
)
SELECT
    legacy_empkey,
    employee_name,
    job_code,
    hourly_rate,
    date_worked,
    week_ending_date,
    hours_worked,
    job_id,
    expenses
FROM stg_payroll;

-- Verify Load
SELECT * FROM fact_labor;
SELECT COUNT(*) FROM fact_labor;

-- Compare the two
SELECT
    p.employee_name,
    p.job_id,
    p.hours_worked,
    fl.employee_name,
    fl.job_id,
    fl.hours_worked
FROM stg_payroll AS p
JOIN fact_labor AS fl
    ON p.job_id = fl.job_id
   AND p.legacy_empkey = fl.legacy_emp_key
   AND p.date_worked = fl.date_worked;
   
DESCRIBE dim_technician;

SELECT
    fl.employee_name,
    fl.legacy_emp_key,
    dt.legacy_emp_key
FROM fact_labor AS fl
JOIN dim_technician AS dt
    ON fl.legacy_emp_key = dt.legacy_emp_key;

-- 26
SELECT COUNT(*) FROM fact_labor;
-- 0
SELECT COUNT(*) FROM dim_technician;
-- 10
SELECT DISTINCT legacy_emp_key
FROM fact_labor
LIMIT 10;
-- 0
SELECT DISTINCT legacy_emp_key
FROM dim_technician
LIMIT 10;

SELECT * FROM dim_technician;

-- skip
UPDATE fact_labor AS fl
JOIN dim_technician AS dt
    ON fl.legacy_emp_key = dt.legacy_emp_key
SET
    fl.emp_key = dt.emp_key;
    
SELECT
	fl.job_id,
    dj.contract_no
FROM fact_labor AS fl
JOIN dim_job AS dj
    ON fl.job_id = dj.job_id;

SELECT COUNT(*) FROM dim_job;
SET SQL_SAFE_UPDATES = 0;
UPDATE fact_labor AS fl
JOIN dim_job AS dj
    ON fl.job_id = dj.job_id
SET fl.contract_no = dj.contract_no;
SET SQL_SAFE_UPDATES = 1;

SELECT
    fl.job_id,
    fl.contract_no AS current_contract,
    dj.contract_no AS new_contract
FROM fact_labor AS fl
JOIN dim_job AS dj
    ON fl.job_id = dj.job_id
LIMIT 20;
    
    

    
    

