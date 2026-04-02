CREATE SCHEMA IF NOT EXISTS `caramel_id202729.raw_devdb`;
CREATE SCHEMA IF NOT EXISTS `caramel_id202729.gold_devdb`;
CREATE SCHEMA IF NOT EXISTS `caramel_id202729.audit_devdb`;

CREATE OR REPLACE TABLE `caramel_id202729.audit_devdb.etl_audit` (
  run_id STRING,
  job_name STRING,
  source_file STRING,
  rows_processed INT64,
  status STRING,
  run_timestamp TIMESTAMP
);
