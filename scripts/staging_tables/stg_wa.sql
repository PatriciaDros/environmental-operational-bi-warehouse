/******************************************************************************
Project : Environmental Operational BI Warehouse
Script  : create_stg_wa.sql
LOAD	: Import Wizard
******************************************************************************/

CREATE TABLE stg_wa (
    building_id VARCHAR(10),
    building_name VARCHAR(100),

    project_id VARCHAR(20),
    project_type VARCHAR(50),

    service_id INT,
    service_name VARCHAR(100),
    initiation_date DATE,

    priority VARCHAR(20),

    contract_no VARCHAR(20),

    wa_number INT,
    wa_type VARCHAR(50),

    date_wa_issued DATE,

    wa_status VARCHAR(100),
    status_date DATE,

    initial_wa_amount DECIMAL(10,2),
    current_approved_amount DECIMAL(10,2),
    proposed_amend_amount DECIMAL(10,2),
    wa_total_amount DECIMAL(10,2),

    load_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

 -- After import wizard - Check all went well, validate data
DESCRIBE stg_wa;
SELECT * FROM stg_wa;


