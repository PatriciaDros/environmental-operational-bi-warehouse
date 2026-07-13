SELECT USER(), CURRENT_USER(), VERSION();
CREATE DATABASE environmental_dw;
USE environmental_dw;

SHOW TABLES;
SHOW FULL TABLES FROM environmental_dw;

CREATE TABLE dim_date (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayName VARCHAR(10),
    MonthName VARCHAR(15),
    Quarter TINYINT,
    Year SMALLINT,
    WeekEndingDate DATE,
    WeekdayFlag CHAR(1)
);

SET SESSION cte_max_recursion_depth = 5000;
SHOW VARIABLES LIKE 'cte_max_recursion_depth';

INSERT INTO dim_date
(
    DateKey,
    FullDate,
    DayName,
    MonthName,
    Quarter,
    Year,
    WeekEndingDate,
    WeekdayFlag
)
WITH RECURSIVE dates AS
(
    SELECT DATE('2019-01-01') AS dt

    UNION ALL

    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM dates
    WHERE dt < '2030-12-31'
)
SELECT
    DATE_FORMAT(dt,'%Y%m%d') + 0 AS DateKey,
    dt,
    DAYNAME(dt),
    MONTHNAME(dt),
    QUARTER(dt),
    YEAR(dt),

    DATE_ADD(
        dt,
        INTERVAL (6 - WEEKDAY(dt)) DAY
    ) AS WeekEndingDate,

    CASE
        WHEN WEEKDAY(dt) < 5 THEN 'Y'
        ELSE 'N'
    END AS WeekdayFlag

FROM dates;

SELECT COUNT(*)
FROM dim_date;

SELECT MIN(FullDate), MAX(FullDate)
FROM dim_date;

SELECT *
FROM dim_date
LIMIT 5;

CREATE TABLE stg_job_list (
    JobID VARCHAR(20),
    BID VARCHAR(20),
    Job_Description VARCHAR(255),
    ServiceID VARCHAR(50),
    Project_ID VARCHAR(50),
    Contract_No VARCHAR(25),
    SAI_Job_Status VARCHAR(50),
    LoadDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE stg_job_list;

SELECT COUNT(*)
FROM stg_job_list;

SELECT COUNT(DISTINCT JobID)
FROM stg_job_list;

SELECT *
FROM stg_job_list
LIMIT 5;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM stg_job_list WHERE JobID='17SD-136' AND BID='M470';
SET SQL_SAFE_UPDATES = 1;

TRUNCATE TABLE stg_job_list;


