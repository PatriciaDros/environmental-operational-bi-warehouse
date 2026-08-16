/******************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_monthly_status.sql
LOAD	: Import Wizard
******************************************************************************/

CREATE TABLE stg_monthly_status (
    job_id               VARCHAR(10),
    contract_number      VARCHAR(15),
    wa_number            INT,
    service_id           VARCHAR(10),
    wa_status            VARCHAR(50),
    initiation_date      DATE,
    wa_estimate_cost     DECIMAL(12,2),
    job_start_date       DATE,
    job_completion_date  DATE,
    rfp_number           INT,
    rfp_date_submitted   DATE,
    amount_invoiced      DECIMAL(12,2),
    amount_received      DECIMAL(12,2),
    date_on_check        DATE,
    date_check_received  DATE,
    billing_status       VARCHAR(30),
    load_date            DATETIME DEFAULT CURRENT_TIMESTAMP
);