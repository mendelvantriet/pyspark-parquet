FROM openjdk:8-jdk-slim

ENV WORKDIR=/opt

ENV INPUT_FILE="/opt/example.parquet" \
    MASTER="local[1]" \
    SPARK_SUBMIT_ARGS=""

COPY files/aws_ecs_entrypoint.sh $WORKDIR/
COPY files/entrypoint.sh $WORKDIR/
COPY src/python_script.py $WORKDIR/
COPY test_data/example.parquet $WORKDIR/
COPY requirements.txt $WORKDIR/

WORKDIR $WORKDIR

RUN chmod +x entrypoint.sh && \
    chmod +x aws_ecs_entrypoint.sh && \
    apt-get update && \
    apt-get install -y python3-pip curl jq && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r requirements.txt

ENTRYPOINT ["/opt/entrypoint.sh"]

