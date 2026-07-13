
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_payroll.csv'
INTO TABLE stg_payroll
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    employee_name,
    job_code,
    hourly_rate,
    date_paid,
    date_worked,
    week_ending_date,
    hours_worked,
    job_id,
    building_id,
    expenses,
    job_type,
    legacy_empkey
);

SELECT COUNT(*) FROM stg_payroll;
SELECT * FROM stg_payroll LIMIT 5;

