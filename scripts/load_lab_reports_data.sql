
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_lab_reports.csv'
INTO TABLE stg_lab_reports
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    client_type,
    building_id,
    job_id,
    report_date,
    batch_no,
    sample_type,
    quantity,
    technician,
    facility
);

SELECT COUNT(*)
FROM stg_lab_reports;

SELECT *
FROM stg_lab_reports
LIMIT 10;

