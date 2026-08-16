/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : dim_technician.sql
Load    : MySQL Table Data Import Wizard
Grain   : One row = One technician under one job title/Yrs Exp
Source  : Built from stg_employees
******************************************************************************/

CREATE TABLE dim_technician (
    tech_key INT PRIMARY KEY,
    emp_id_key VARCHAR(10),
    job_title VARCHAR(40),
    yrs_exp INT,
    job_title_yrs_exp_key VARCHAR(50),
    emp_alias VARCHAR(10),
    load_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE dim_technician;
SELECT * FROM dim_technician 
LIMIT 10;

