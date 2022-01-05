import os
from pyspark.sql import SparkSession

spark = SparkSession.builder \
  .master(os.environ.get('MASTER')) \
  .appName(os.environ.get('APP_NAME')) \
  .config("spark.sql.execution.arrow.pyspark.enabled", "true") \
  .config("spark.sql.execution.arrow.pyspark.fallback.enabled", "true") \
  .config("spark.sql.parquet.mergeSchema", "false") \
  .config("spark.hadoop.parquet.enable.summary-metadata", "false") \
  .getOrCreate()
        
df = spark.read.parquet(os.environ.get('INPUT_FILE'))
df.write.mode("overwrite").parquet(os.environ.get('OUTPUT_LOCATION'))

