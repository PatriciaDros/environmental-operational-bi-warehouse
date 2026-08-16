/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : dim_sca_labor_rate.sql
Load    : MySQL Table Data Import Wizard
Grain   : One row = One SCA labor rate for one contract, job title,
          and years of experience
Source  : Built from stg_sca_rates
******************************************************************************/

CREATE TABLE dim_sca_labor_rate (
    sca_labor_rate_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_no VARCHAR(20),
    job_title VARCHAR(50),
    category VARCHAR(25),
    title VARCHAR(75),
    sca_job_title_key VARCHAR(100),
    yrs_exp TINYINT,
    hourly_rate DECIMAL(10,2),
    home_hourly DECIMAL(10,2),
    field_hourly DECIMAL(10,2),
    load_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE dim_sca_labor_rate;
SELECT * FROM dim_sca_labor_rate;

