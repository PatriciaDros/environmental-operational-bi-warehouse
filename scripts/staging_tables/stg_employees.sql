/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_employees.sql
Load	: DATA WIZARD
Source	: Raw company employee data imported from Excel
******************************************************************************/

CREATE TABLE stg_employees (
    emp_id      INT,
    emp_alias   VARCHAR(15),
    emp_type    VARCHAR(15),
    is_active   VARCHAR(1)
);

DESCRIBE stg_employees;
SELECT * FROM stg_employees;