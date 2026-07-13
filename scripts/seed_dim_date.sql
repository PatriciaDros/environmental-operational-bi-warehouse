
SET SESSION cte_max_recursion_depth = 5000;

INSERT INTO dim_date
(
    date_key,
    full_date,
    day_name,
    month_name,
    quarter,
    calendar_year,
    week_ending_date,
    is_weekday
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
    DATE_FORMAT(dt,'%Y%m%d') + 0,
    dt,
    DAYNAME(dt),
    MONTHNAME(dt),
    QUARTER(dt),
    YEAR(dt),
    DATE_ADD(
        dt,
        INTERVAL (6 - WEEKDAY(dt)) DAY
    ),

    CASE
        WHEN WEEKDAY(dt) < 5 THEN TRUE
        ELSE FALSE
    END

FROM dates;

SELECT COUNT(*) AS total_dates
FROM dim_date;