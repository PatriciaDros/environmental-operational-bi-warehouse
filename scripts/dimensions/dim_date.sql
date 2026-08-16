

CREATE TABLE dim_date (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayName VARCHAR(10),
    MonthName VARCHAR(10),
    CalendarQuarter VARCHAR(2),
    CalendarYear INT,
    WeekEndingDate DATE,
    WeekdayFlag VARCHAR(10)
);

SET SESSION cte_max_recursion_depth = 2000;

INSERT INTO dim_date
(
    DateKey,
    FullDate,
    DayName,
    MonthName,
    CalendarQuarter,
    CalendarYear,
    WeekEndingDate,
    WeekdayFlag
)

WITH RECURSIVE dates AS (
    SELECT DATE('2022-01-01') AS dt

    UNION ALL

    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM dates
    WHERE dt < '2026-12-31'
)

SELECT
    DATE_FORMAT(dt,'%Y%m%d'),
    dt,
    DAYNAME(dt),
    MONTHNAME(dt),
    CONCAT('Q',QUARTER(dt)),
    YEAR(dt),

    DATE_ADD(
        dt,
        INTERVAL (7 - DAYOFWEEK(dt)) DAY
    ),

    CASE
        WHEN DAYOFWEEK(dt) IN (1,7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END

FROM dates;

-- Validate Load
SELECT COUNT(*) AS TotalDates
FROM dim_date;

-- DateKey matches full date
SELECT *
FROM dim_date
ORDER BY FullDate
LIMIT 10;


-- Check for duplicates
SELECT
    FullDate,
    COUNT(*) AS Cnt
FROM dim_date
GROUP BY FullDate
HAVING COUNT(*) > 1;
