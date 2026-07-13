
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_sca_wa.csv'
INTO TABLE stg_sca_wa
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    building_id,
    building_name,
    building_address,
    project_id,
    project_name,
    project_type,
    service_id,
    service_name,
    service_initiation_date,
    priority,
    primary_hygienist,
    contract_no,
    wa_number,
    wa_type,
    date_wa_issued,
    wa_status,
    status_date,
    expected_due_date,
    original_wa_amt,
    current_approved_amt,
    proposed_amendment_amt,
    current_wa_total
);

SELECT COUNT(*) FROM stg_sca_wa;
SELECT * FROM stg_sca_wa LIMIT 5;

UPDATE stg_sca_wa
SET expected_due_date = NULL
WHERE expected_due_date = '0000-00-00';

ALTER TABLE stg_sca_wa
DROP COLUMN expected_due_date;

DESCRIBE stg_sca_wa;