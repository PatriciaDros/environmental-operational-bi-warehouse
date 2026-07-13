
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_employees.csv'
INTO TABLE stg_employees
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    last_name,
    first_name,
    full_name,
    employee_id,
    employee_type,
    is_active
);

SELECT COUNT(*) FROM stg_employees;
SELECT * FROM stg_employees LIMIT 5;

