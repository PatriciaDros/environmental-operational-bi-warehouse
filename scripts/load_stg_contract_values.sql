SHOW databases;
SELECT count(*) FROM stg_contract_values;

DESCRIBE stg_contract_values;

SHOW VARIABLES LIKE 'local_infile';

SELECT VERSION();

SET GLOBAL local_infile = ON;

-- ============================================================================
-- Load: stg_contract_values
-- ============================================================================

LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_contract_values.csv'
INTO TABLE stg_contract_values
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    contract_no,
    contract_status,
    @execution_date,
    @expiration_date,
    home_multiplier,
    field_multiplier,
    contract_value
)
SET
execution_date = STR_TO_DATE(@execution_date,'%m-%d-%Y'),
expiration_date = STR_TO_DATE(@expiration_date,'%m-%d-%Y');