/*****************************************************************************
Project : Environmental Operational BI Warehouse
Script  : stg_lab_reports.sql
Load	: DATA WIZARD
Source	: Raw company lab report data imported from Excel
******************************************************************************/

CREATE TABLE stg_lab_reports (
    building_id      VARCHAR(10),
    job_id           VARCHAR(10),
    report_date      DATE,
    batch_no         VARCHAR(20),
    sample_type      VARCHAR(20),
    quantity         INT,
    emp_alias        VARCHAR(20),
    facility         VARCHAR(20),
    sample_category  VARCHAR(15),
    load_date        DATETIME
                     DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE stg_lab_reports;
SELECT * FROM stg_lab_reports;

