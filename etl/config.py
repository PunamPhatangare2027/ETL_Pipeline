
PROJECT_ID = "caramel_id202729"
REGION = "us-central1"

RAW_BUCKET = "caramel-raw-bucket-202729"
TEMP_BUCKET = "caramel-temp-bucket-202729"

INPUT_FILE = f"gs://{RAW_BUCKET}/input/sales_data.csv"
TEMP_LOCATION = f"gs://{TEMP_BUCKET}/temp"
STAGING_LOCATION = f"gs://{TEMP_BUCKET}/staging"

BQ_TABLE = f"{PROJECT_ID}:gold_devdb.sales_summary"