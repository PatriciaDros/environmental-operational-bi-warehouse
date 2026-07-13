/******************************************************************************
 Environmental Data Warehouse
 utilities.sql

 Purpose:
 Frequently used SQL commands for developing and maintaining the warehouse.

 Author: Patricia
******************************************************************************/

-- ============================================================================
-- 1. CONNECT TO THE DATABASE
-- ============================================================================

SHOW DATABASES;

USE environmental_dw_portfolio;

SELECT DATABASE();

SHOW TABLES;

SHOW FULL TABLES;

-- ============================================================================
-- 2. EXPLORE TABLES
-- ============================================================================

DESCRIBE stg_payroll;

DESCRIBE stg_job_list;

DESCRIBE fact_labor;

SHOW CREATE TABLE stg_payroll;

SHOW CREATE TABLE fact_labor;

-- ============================================================================
-- 3. PREVIEW DATA
-- ============================================================================

SELECT *
FROM stg_payroll
LIMIT 10;

SELECT *
FROM stg_job_list
LIMIT 10;

SELECT *
FROM fact_labor
LIMIT 10;

-- ============================================================================
-- 4. CHECK ROW COUNTS
-- ============================================================================

SELECT COUNT(*) FROM stg_job_list;

SELECT COUNT(*) FROM stg_payroll;

SELECT COUNT(*) FROM stg_lab_reports;

SELECT COUNT(*) FROM dim_employee;

SELECT COUNT(*) FROM dim_job;

SELECT COUNT(*) FROM fact_labor;

SELECT COUNT(*) FROM fact_lab;

SELECT COUNT(*) FROM fact_profitability;

-- ============================================================================
-- 5. LOOK FOR NULLS
-- ============================================================================

SELECT *
FROM stg_job_list
WHERE Job_ID IS NULL;

SELECT *
FROM stg_payroll
WHERE Job_ID IS NULL;

SELECT *
FROM stg_payroll
WHERE Employee_Name IS NULL;

-- ============================================================================
-- 6. DISTINCT VALUES
-- ============================================================================

SELECT DISTINCT Job_Type
FROM stg_payroll;

SELECT DISTINCT Contract_No
FROM stg_job_list;

SELECT DISTINCT Job_Code
FROM stg_payroll;

-- ============================================================================
-- 7. SORTING
-- ============================================================================

SELECT *
FROM stg_payroll
ORDER BY Date_Worked DESC;

SELECT *
FROM stg_job_list
ORDER BY Job_ID;

-- ============================================================================
-- 8. SIMPLE FILTERS
-- ============================================================================

SELECT *
FROM stg_payroll
WHERE Employee_Name = 'John Smith';

SELECT *
FROM stg_job_list
WHERE Contract_No = '...';

-- ============================================================================
-- 9. VERIFY KEYS
-- ============================================================================

SELECT Job_ID
FROM stg_job_list;

SELECT DISTINCT Job_ID
FROM stg_payroll;

-- ============================================================================
-- 10. INFORMATION_SCHEMA
-- ============================================================================

SHOW TABLE STATUS;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'environmental_dw_portfolio';

SELECT column_name,
       data_type
FROM information_schema.columns
WHERE table_name = 'stg_payroll';

-- ============================================================================
-- 11. SAFE DEVELOPMENT
-- ============================================================================

-- Always preview before deleting!

SELECT *
FROM stg_payroll
WHERE Job_ID = 'example';

-- DELETE FROM stg_payroll
-- WHERE Job_ID = 'example';

-- ============================================================================
-- 12. SESSION INFORMATION
-- ============================================================================

SELECT VERSION();

SELECT CURRENT_USER();

SELECT NOW();

SELECT DATABASE();

-- ============================================================================
-- 13. REMINDERS
-- ============================================================================

-- SHOW DATABASES;
-- USE environmental_dw_portfolio;
-- SHOW TABLES;
-- DESCRIBE table_name;
-- SELECT * FROM table_name LIMIT 10;
-- SELECT COUNT(*) FROM table_name;
-- Disable safe updates

SET SQL_SAFE_UPDATES = 0;

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

-- Turn off foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Turn on foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE stg_monthly_status
MODIFY COLUMN rfp_no INT;