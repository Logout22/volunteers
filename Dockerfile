FROM python:3.6-buster

RUN apt-get update -y && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y sqlite

RUN mkdir -p logs tool/media/mugshots

RUN sqlite3 volunteers.db && \
    sqlite3 penta.db

COPY manage.py requirements-frozen.txt ./
COPY volunteer_mgmt volunteer_mgmt
COPY volunteers volunteers

RUN python -m venv venv

RUN . venv/bin/activate && \
    pip install -r requirements-frozen.txt && \
    pip install gunicorn

RUN sed "\
        s/backends.postgresql_psycopg2/backends.sqlite3/; \
        s/'NAME': '\([a-z]\+\)'/'NAME': '\1.db'/; \
    " \
    volunteer_mgmt/localsettings_example.py \
    > volunteer_mgmt/localsettings.py

RUN . venv/bin/activate && \
    ./manage.py migrate && \
    ./manage.py collectstatic && \
    ./manage.py createsuperuser --noinput --username test --email me@fosdem.org
