import os
from pyspark.sql import SparkSession

spark = SparkSession.builder \
  .master(os.environ.get('MASTER')) \
  .appName(os.environ.get('APP_NAME')) \
  .getOrCreate()
        
df = spark.read.parquet(os.environ.get('INPUT_FILE'))
df.write.mode("overwrite").parquet(os.environ.get('OUTPUT_LOCATION'))

