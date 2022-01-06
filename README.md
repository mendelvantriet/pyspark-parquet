# pyspark-parquet

Since Spark 3 comes with Apache Arrow integration, it seems Spark is now better equiped to handle columnar data. That should speed up operations on parquet files as well as conversions to and from numpy and pandas objects (libraries that are often used to handle parquet files in Python).

## Run python script

    cp example.env .env
    set -o allexport; source .env; set +o allexport
    spark-submit ${SPARK_SUBMIT_ARGS} python_script.py

## Build Docker image

    docker build -t demo .

## AWS integration

The docker-compose file can be used for simulating an s3 storage. The `aws_entrypoint.sh` file should not be needed, depending on your credentials provider. 

## References

- https://towardsdatascience.com/distributed-processing-with-pyarrow-powered-new-pandas-udfs-in-pyspark-3-0-8f1fe4c15208

