
LOAD DATA LOCAL INFILE '/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse/data/stg_sca_fixed_prices.csv'
INTO TABLE stg_sca_fixed_prices
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    contract_no,
    work_type_code,
    work_type_description,
    fixed_price,
    status_date
);

SELECT COUNT(*) FROM stg_sca_fixed_prices;
SELECT * FROM stg_sca_fixed_prices LIMIT 5;