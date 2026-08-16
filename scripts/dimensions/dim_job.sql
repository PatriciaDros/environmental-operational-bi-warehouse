/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : dim_job.sql
Load	: DATA WIZARD
Grain	: One row = One JobID
Business Key	: job_id
Surrogate Key	: job_key
******************************************************************************/

CREATE TABLE dim_job (
    job_key INT AUTO_INCREMENT PRIMARY KEY,
    job_id VARCHAR(10) NOT NULL UNIQUE,
    building_id VARCHAR(10) NOT NULL,
    job_description VARCHAR(100),
    service_id INT,
    project_id VARCHAR(10),
    contract_no VARCHAR(20),
    wa_number INT,
    job_status VARCHAR(10),
    load_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE dim_job;
SELECT * FROM dim_job;