/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_payroll.sql
Load	: DATA WIZARD
Source	: Raw company payroll transactions imported from Excel
Grain	: One employee working one job on one day under
******************************************************************************/

CREATE TABLE stg_payroll (
    payroll_id        INT AUTO_INCREMENT PRIMARY KEY,
    emp_id            INT,
    emp_alias         VARCHAR(5),
    job_code          VARCHAR(5),
    hourly_rate       DECIMAL(10,2),
    date_paid         DATE,
    date_worked       DATE,
    week_ending_date  DATE,
    hours_worked      DECIMAL(6,2),
    job_id            VARCHAR(10),
    building_id       VARCHAR(5),
    expenses          DECIMAL(10,2),
    load_date         DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE stg_payroll;
SELECT * FROM stg_payroll;
