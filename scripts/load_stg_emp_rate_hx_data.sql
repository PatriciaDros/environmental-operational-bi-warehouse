
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_emp_rate_history.csv'
INTO TABLE stg_emp_rate_history
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    legacy_emp_key,
    employee_name,
    job_code,
    job_title,
    sca_experience_tier,
    rate_start_date,
    rate_end_date,
    hourly_rate
);

SELECT COUNT(*)
FROM stg_emp_rate_history;

SELECT *
FROM stg_emp_rate_history
LIMIT 10;

