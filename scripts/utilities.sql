/******************************************************************************
 File:        00_utilities.sql
 Project:     Environmental Data Warehouse Portfolio
 Author:      Me

 Purpose:
 Daily utility script used to connect to MySQL, inspect the warehouse,
 validate data, troubleshoot issues, and perform common administrative tasks.

 NOTE:
 This file is NOT part of the ETL.
 It is my personal SQL toolbox.
******************************************************************************/

-- ============================================================================
-- 1. START OF DAY - ENVIRONMENT CHECK
-- ============================================================================

-- Show available databases
SHOW DATABASES;

-- Select the warehouse
USE environmental_dw_portfolio;

-- Verify current database
SELECT DATABASE();

-- Verify tables exist
SHOW TABLES;

SHOW FULL TABLES;

-- ============================================================================
-- 2. VERIFY TABLE STRUCTURES
-- ============================================================================

DESCRIBE stg_job_list;
DESCRIBE stg_payroll;
DESCRIBE stg_lab_reports;

DESCRIBE dim_employee;
DESCRIBE dim_job;
DESCRIBE dim_date;

DESCRIBE fact_labor;
DESCRIBE fact_lab;
DESCRIBE fact_profitability;

-- ============================================================================
-- 3. VERIFY DATA EXISTS
-- ============================================================================

SELECT COUNT(*) AS Job_List
FROM stg_job_list;

SELECT COUNT(*) AS Payroll
FROM stg_payroll;

SELECT COUNT(*) AS Lab_Reports
FROM stg_lab_reports;

SELECT COUNT(*) AS Employees
FROM dim_employee;

SELECT COUNT(*) AS Jobs
FROM dim_job;

SELECT COUNT(*) AS Labor_Facts
FROM fact_labor;

SELECT COUNT(*) AS Lab_Facts
FROM fact_lab;

SELECT COUNT(*) AS Profitability
FROM fact_profitability;

-- ============================================================================
-- 4. PREVIEW DATA
-- ============================================================================

SELECT *
FROM stg_job_list
LIMIT 10;

SELECT *
FROM stg_payroll
LIMIT 10;

SELECT *
FROM stg_lab_reports
LIMIT 10;

SELECT *
FROM fact_labor
LIMIT 10;

-- ============================================================================
-- 5. DATA QUALITY CHECKS
-- ============================================================================

-- Missing Job IDs

SELECT *
FROM stg_payroll
WHERE Job_ID IS NULL;

-- Missing Employee Names

SELECT *
FROM stg_payroll
WHERE Employee_Name IS NULL;

-- Missing Contract Numbers

SELECT *
FROM stg_job_list
WHERE Contract_No IS NULL;

-- ============================================================================
-- 6. EXPLORE DATA
-- ============================================================================

SELECT DISTINCT Job_Code
FROM stg_payroll;

SELECT DISTINCT Job_Type
FROM stg_payroll;

SELECT DISTINCT Contract_No
FROM stg_job_list;

-- ============================================================================
-- 7. SESSION SETTINGS
-- ============================================================================

-- Disable Safe Updates

SET SQL_SAFE_UPDATES = 0;

-- Enable Safe Updates

SET SQL_SAFE_UPDATES = 1;

-- Disable Foreign Key Checks

SET FOREIGN_KEY_CHECKS = 0;

-- Enable Foreign Key Checks

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================================
-- 8. TABLE MAINTENANCE
-- ============================================================================

SHOW CREATE TABLE stg_monthly_status;

ALTER TABLE stg_monthly_status
MODIFY COLUMN rfp_no INT;

-- Rename table

-- RENAME TABLE old_table TO new_table;

-- ============================================================================
-- 9. DROP TABLES (USE CAREFULLY)
-- ============================================================================

DROP TABLE IF EXISTS fact_profitability;

DROP TABLE IF EXISTS fact_lab;

DROP TABLE IF EXISTS fact_labor;

DROP TABLE IF EXISTS dim_employee;

DROP TABLE IF EXISTS dim_job;

-- DROP COLUMN wa_no;

-- ============================================================================
-- 10. DATABASE INFORMATION
-- ============================================================================

SELECT VERSION();

SELECT CURRENT_USER();

SELECT DATABASE();

SELECT NOW();

SHOW TABLE STATUS;

-- ============================================================================
-- 11. INFORMATION_SCHEMA
-- ============================================================================

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'environmental_dw_portfolio';

SELECT column_name,
       data_type
FROM information_schema.columns
WHERE table_schema = 'environmental_dw_portfolio';

-- ============================================================================
-- 12. SCRATCH PAD
-- ============================================================================

/*
Temporary queries go here while developing.

Example:

SELECT *
FROM stg_payroll
WHERE Employee_Name = 'Smith';

*/