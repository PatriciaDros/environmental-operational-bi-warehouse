/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : dim_rfp.sql
Load    : MySQL Table Data Import Wizard
Grain   : One row = One RFP for one Job
Source  : Built from stg_monthly_status (driving table)
          joined to dim_job

Business Key : (job_key, rfp_number)
******************************************************************************/
CREATE TABLE dim_rfp (
    job_key              INT,
    job_id               VARCHAR(10),
    rfp_number           INT,
    rfp_amount_invoiced  DECIMAL(12,2),
    date_job_complete    DATE,
    rfp_date             DATE,
    load_date            DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (job_key, rfp_number)
);

DESCRIBE dim_rfp;

INSERT INTO dim_rfp (
    job_key,
    job_id,
    rfp_number,
    rfp_amount_invoiced,
    date_job_complete,
    rfp_date
)
SELECT
    j.job_key,
    j.job_id,
    m.rfp_number,
    m.amount_invoiced,
    m.job_completion_date,
    m.rfp_date_submitted
FROM stg_monthly_status m
JOIN dim_job j
    ON m.job_id = j.job_id;

SELECT * FROM dim_rfp;

