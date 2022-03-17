FROM python:3.9-alpine

ENV PYTHONUNBUFFERED 1

RUN  mkdir /moto/
RUN apk update && apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo
WORKDIR /moto/
RUN  pip --no-cache-dir install --upgrade pip flask flask_cors && \
     pip --no-cache-dir install moto

ENTRYPOINT ["/usr/local/bin/moto_server", "-H", "0.0.0.0"]

EXPOSE 5000
