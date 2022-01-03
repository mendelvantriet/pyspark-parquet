# pyspark-parquet

## Run python script

    cp example.env .env
    set -o allexport; source .env; set +o allexport
    spark-submit ${SPARK_SUBMIT_ARGS} python_script.py

## Build Docker image

    docker build -t demo .


