-- ETL Join Readiness Checklist --

-- Are tables created 
SELECT COUNT(*) FROM fact_labor;

SELECT * FROM fact_labor LIMIT 3;

SELECT COUNT(*) FROM dim_technician;
SELECT * FROM dim_technician LIMIT 3;
SELECT COUNT(*) FROM dim_labor_sca_map;

-- Is the join column populated? Check different column names
SELECT COUNT(*)
FROM fact_labor
WHERE legacy_emp_key IS NULL;

-- Are there hidden spaces or bad characters?
-- Gives me [contract_no] for each row in dataset
SELECT
    CONCAT('[', contract_no, ']') AS contract_no
FROM dim_labor_sca_map
LIMIT 5;

-- Do both tables use the same format?
SELECT DISTINCT sca_job_title
FROM dim_technician;

-- against

SELECT DISTINCT title
FROM dim_labor_sca_map;

-- Are duplicates expected? Should be 0
SELECT
map_sca_labor_key,
COUNT(*)
FROM dim_labor_sca_map
GROUP BY map_sca_labor_key
HAVING COUNT(*)>1;

-- Yes Duplicates, check rows of returned duplicates
SELECT *
FROM dim_labor_sca_map
WHERE map_sca_labor_key = 'C000015128 PCB Field Technician|3';

-- Chat says add a CONSTRAINT
ALTER TABLE dim_labor_sca_map
ADD CONSTRAINT uq_map_sca_labor_key
UNIQUE (map_sca_labor_key);

-- Are the business keys unique? Same as check duplicates - just make sure
SELECT
    map_sca_labor_key,
    COUNT(*) AS count
FROM dim_labor_sca_map
GROUP BY map_sca_labor_key
HAVING COUNT(*) > 1;

-- DO A TEST JOIN - do this before writing an UPDATE.
SELECT fl.legacy_emp_key, dt.legacy_emp_key
FROM fact_labor fl
JOIN dim_technician dt
 ON fl.legacy_emp_key = dt.legacy_emp_key
 WHERE fl.legacy_emp_key = 'leongroysman01'
LIMIT 10;

-- COUNT UNMATCHED ROWS -> WHERE joined_table.primary_key IS NULL;
SELECT COUNT(*)
FROM fact_labor fl
JOIN dim_technician dt
 ON fl.legacy_emp_key = dt.legacy_emp_key
 WHERE dt.legacy_emp_key IS NULL;
 
 /* 
USE A MENTAL WORKFLOW
Whenever I join tables I think:
Does the data exist?
↓
Is it clean?
↓
Does the key exist?
↓
Is the key unique?
↓
Does a sample join work?
↓
How many rows don't match?
↓
Only then write UPDATE.
 */

