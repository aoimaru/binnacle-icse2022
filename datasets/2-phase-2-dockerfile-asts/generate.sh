#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# 第一引数の指定
TARGET=$1

# Build
docker build -t binnacle/artifact:generate-phase-2 \
  -f "${DIR}/generate/Dockerfile" "${DIR}/generate" --build-arg TARGET=$TARGET

# Run with volume mounts
time docker run \
  -it \
  --rm \
  -v "${DIR}/../1-phase-1-dockerfile-asts:/mnt/inputs" \
  -v "${DIR}:/mnt/outputs" \
  binnacle/artifact:generate-phase-2
