#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

RESPONSE=$(curl -s http://169.254.170.2${AWS_CONTAINER_CREDENTIALS_RELATIVE_URI})

export AWS_ACCESS_KEY_ID=$(echo $RESPONSE | jq -r '.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $RESPONSE | jq -r '.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $RESPONSE | jq -r '.Token')

export SPARK_SUBMIT_ARGS="${SPARK_SUBMIT_ARGS} --conf spark.hadoop.fs.s3a.access.key=${AWS_ACCESS_KEY_ID} --conf spark.hadoop.fs.s3a.secret.key=${AWS_SECRET_ACCESS_KEY}"

exec /opt/entrypoint.sh "$@"

