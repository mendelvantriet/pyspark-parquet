FROM openjdk:8-jdk-slim

ENV WORKDIR=/opt

ENV INPUT_FILE="/opt/example.parquet" \
    MASTER="local[1]"

COPY entrypoint.sh $WORKDIR/
COPY example.parquet $WORKDIR/
COPY python_script.py $WORKDIR/
COPY requirements.txt $WORKDIR/

WORKDIR $WORKDIR

RUN chmod +x entrypoint.sh && \
    apt-get update && \
    apt-get install -y python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r requirements.txt

ENTRYPOINT ["/opt/entrypoint.sh"]

