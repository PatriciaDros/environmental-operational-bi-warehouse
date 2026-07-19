
SELECT * FROM dim_job;
DESCRIBE stg_job_list;
DESCRIBE dim_job;

/*==============================================================
  dim_job

  Purpose:
    Stores one record per JobID.

  Source:
    stg_job_list
    stg_monthly_status
    stg_sca_wa

  Grain:
    One row per JobID.

==============================================================*/

INSERT INTO dim_job
(
    job_id,
    building_id,
    project_description,
    service_id,
    project_id,
    contract_no,
    job_status,
    load_date
)
SELECT
    job_id,
    building_id,
    job_description,
    service_id,
    project_id,
    contract_no,
    sai_job_status,
    load_date
FROM stg_job_list;
