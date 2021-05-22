FROM python:3.7-buster

RUN apt-get update -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y sqlite

COPY ./entrypoint.sh ./

ENTRYPOINT ["/entrypoint.sh"]
