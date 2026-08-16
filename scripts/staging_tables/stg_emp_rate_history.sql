/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_emp_rate_history.sql
Load	: DATA WIZARD
Source	: Raw company historical employee hourly rate data imported from Excel
TYPE	: SCD-2 Slow Changing Dimension Type 2 Table
******************************************************************************/

CREATE TABLE stg_emp_rate_history (
    emp_id            INT,
    emp_alias         VARCHAR(20),
    job_code          VARCHAR(2),
    job_title         VARCHAR(40),
    yrs_exp           TINYINT,
    rate_start_date   DATE,
    rate_end_date     DATE,
    hourly_rate       DECIMAL(10,2),
    load_date         DATETIME DEFAULT CURRENT_TIMESTAMP
    );

DESCRIBE stg_emp_rate_history;
SELECT * FROM stg_emp_rate_history;

