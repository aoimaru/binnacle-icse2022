#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# 第一引数の指定
TARGET=$1

# Build
docker build -t binnacle/artifact:generate-phase-1 \
  -f "${DIR}/generate/Dockerfile" "${DIR}/generate" \
  --build-arg TARGET=$TARGET

# Run with volume mounts
time docker run \
  -it \
  --rm \
  -v "${DIR}/../0b-deduplicated-dockerfile-sources:/mnt/inputs" \
  -v "${DIR}:/mnt/outputs" \
  binnacle/artifact:generate-phase-1
