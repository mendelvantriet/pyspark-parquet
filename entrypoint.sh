#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


exec spark-submit ${SPARK_SUBMIT_ARGS} python_script.py "$@"

