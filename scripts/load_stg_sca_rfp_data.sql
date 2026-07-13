
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_sca_rfp.csv'
INTO TABLE stg_sca_rfp
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    building_id,
    project_id,
    project_description,
    service_id,
    service_name,
    initiation_date,
    primary_hygienist,
    wa_number,
    contract_no,
    rfp_no,
    is_final,
    rfp_status,
    rfp_status_date,
    erfp_status,
    erfp_status_date
);

SELECT COUNT(*) FROM stg_sca_rfp;
SELECT * FROM stg_sca_rfp LIMIT 5;
