FROM python:3.7.6-slim-stretch

RUN apt-get update \
  && apt-get install -y --no-install-recommends xz-utils \
  && rm -rf /var/apt/lists*

RUN pip install --no-cache dockerfile tqdm

COPY . /app/

ARG TARGET
ENV TARGET ${TARGET}

ENTRYPOINT "/app/entrypoint.sh" $TARGET
