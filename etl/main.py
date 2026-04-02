import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import StandardOptions
from apache_beam.options.pipeline_options import GoogleCloudOptions
from apache_beam.options.pipeline_options import SetupOptions

from config import PROJECT_ID, REGION, INPUT_FILE, TEMP_LOCATION, STAGING_LOCATION, BQ_TABLE
from transforms import parse_csv_line


class FilterValidRows(beam.DoFn):
    def process(self, element):
        if element is not None:
            yield element


class AddAuditFields(beam.DoFn):
    def process(self, element):
        element["etl_status"] = "SUCCESS"
        yield element


def run():
    pipeline_options = PipelineOptions()
    google_cloud_options = pipeline_options.view_as(GoogleCloudOptions)

    google_cloud_options.project = PROJECT_ID
    google_cloud_options.region = REGION
    google_cloud_options.job_name = "sales-etl-job-demo"
    google_cloud_options.temp_location = TEMP_LOCATION
    google_cloud_options.staging_location = STAGING_LOCATION

    pipeline_options.view_as(StandardOptions).runner = "DataflowRunner"
    pipeline_options.view_as(SetupOptions).save_main_session = True

    with beam.Pipeline(options=pipeline_options) as pipeline:
        (
            pipeline
            | "Read CSV" >> beam.io.ReadFromText(INPUT_FILE)
            | "Parse CSV" >> beam.Map(parse_csv_line)
            | "Filter Invalid Rows" >> beam.ParDo(FilterValidRows())
            | "Add Status" >> beam.ParDo(AddAuditFields())
            | "Write to BigQuery" >> beam.io.WriteToBigQuery(
                BQ_TABLE,
                schema="""
                    order_id:STRING,
                    product_name:STRING,
                    category:STRING,
                    quantity:INTEGER,
                    price:FLOAT,
                    total_amount:FLOAT,
                    etl_status:STRING
                """,
                write_disposition=beam.io.BigQueryDisposition.WRITE_TRUNCATE,
                create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED
            )
        )


if __name__ == "__main__":
    run()
