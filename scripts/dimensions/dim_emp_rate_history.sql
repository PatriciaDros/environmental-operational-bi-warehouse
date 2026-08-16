 /*****************************************************************************
 Project : Environmental Operational BI Warehouse
 Script  : dim_emp_rate_history.sql
 Load    : MySQL Table Data Import Wizard
 Grain   : One row = One employee hourly rate during a defined date range
 Source  : Built from stg_emp_rate_history

 Surrogate Key : rate_hx_key
******************************************************************************/

CREATE TABLE dim_emp_rate_history (
    rate_hx_key INT AUTO_INCREMENT PRIMARY KEY,
    emp_id_key INT,
    emp_alias VARCHAR(15),
    start_date DATE,
    end_date DATE,
    hourly_rate DECIMAL(5,2)
);

DESCRIBE dim_emp_rate_history;
SELECT * FROM dim_emp_rate_history;


