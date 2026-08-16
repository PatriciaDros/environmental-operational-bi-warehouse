/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_contract_values.sql
Load	: INSERT INTO
Source	: Contract data downloaded from client
******************************************************************************/

CREATE TABLE stg_contract_values (
    contract_no        VARCHAR(15),
    contract_status    VARCHAR(20),
    execution_date     DATE,
    expiration_date    DATE,
    home_multiplier    DECIMAL(4,2),
    field_multiplier   DECIMAL(4,2),
    contract_value     DECIMAL(12,2),
    load_date          DATETIME DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;
DESCRIBE stg_contract_values;

INSERT INTO stg_contract_values (
    contract_no,
    contract_status,
    execution_date,
    expiration_date,
    home_multiplier,
    field_multiplier,
    contract_value
)
VALUES
(
    'CT-001',
    'Closed',
    '2022-03-01',
    '2025-02-28',
    2.75,
    2.54,
    6250000.00
),
(
    'CT-002',
    'Closed',
    '2018-11-20',
    '2021-11-19',
    2.51,
    2.41,
    5820000.00
),
(
    'CT-003',
    'Open',
    '2025-03-12',
    '2028-03-11',
    3.00,
    2.93,
    473000.00
);

SELECT * FROM stg_contract_values;

