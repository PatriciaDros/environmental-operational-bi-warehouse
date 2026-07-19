DESCRIBE dim_labor_sca_map;

SELECT COUNT(*) FROM dim_labor_sca_map;

-- ============================================================================
-- Load: dim_labor_sca_map
-- ============================================================================

LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/labor_sca_map.csv'
INTO TABLE dim_labor_sca_map
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    category,
    title,
    years_experience,
    map_sca_labor_key,
    sca_labor_rate_lookup,
    max_load_field_hourly,
    actual_bill_rate,
    contract_no
);

SET GLOBAL local_infile = ON;

SHOW VARIABLES LIKE 'local_infile';

