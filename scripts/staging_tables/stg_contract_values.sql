/******************************************************************************
Project : Environmental Operational BI Warehouse
Script  : 01_create_staging_tables.sql

Purpose
-------
Creates all staging tables used to import the curated operational dataset.

The staging layer preserves the source structure while applying only minimal
standardization. Business logic is intentionally excluded and is implemented
later during dimensional modeling and fact table construction.
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
    'C000015869',
    'Closed',
    '2022-03-01',
    '2025-02-28',
    2.75,
    2.54,
    6000000.00
),
(
    'C000015128',
    'Closed',
    '2018-11-20',
    '2021-11-19',
    2.51,
    2.41,
    6000000.00
),
(
    'C000016435',
    'Open',
    '2025-03-12',
    '2028-03-11',
    3.00,
    2.93,
    500000.00
);

SELECT * FROM stg_contract_values;