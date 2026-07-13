
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_job_list.csv'
INTO TABLE stg_job_list
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    job_id,
    building_id,
    job_description,
    service_id,
    project_id,
    contract_no,
    sai_job_status
);

SELECT COUNT(*) FROM stg_job_list;
SELECT * FROM stg_job_list LIMIT 5;

UPDATE stg_job_list
SET building_id = 'R455'
WHERE job_id = '23S-056';

SET SQL_SAFE_UPDATES = 0;

SELECT job_id, building_id
FROM stg_job_list
WHERE job_id = '23S-056';

SET SQL_SAFE_UPDATES = 1;


