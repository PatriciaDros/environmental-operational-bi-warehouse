
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_monthly_status.csv'
INTO TABLE stg_monthly_status
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    job_id,
    contract_no,
    building_id,
    school_name,
    wa_no,
    service_id,
    project_type,
    primary_hygienist,
    service_name,
    wa_type,
    wa_status,
    initiation_date,
    wa_estimate_cost,
    actual_start_date,
    actual_completion_date,
    rfp_no,
    rfp_date,
    amount_invoiced,
    amount_received,
    amount_outstanding,
    check_no,
    check_date,
    payment_received_date,
    billing_status
);

SELECT COUNT(*) FROM stg_monthly_status;
SELECT * FROM stg_monthly_status LIMIT 5;

