/******************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_job_list.sql
LOAD	: Import Wizard
******************************************************************************/

CREATE TABLE stg_job_list (
    job_id           VARCHAR(10),
    building_id      VARCHAR(10),
    job_description  VARCHAR(35),
    service_id       INT,
    project_id       VARCHAR(10),
    contract_no      VARCHAR(15),
    job_status       VARCHAR(15),
    load_date        DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE stg_job_list;
SELECT * FROM stg_job_list;
