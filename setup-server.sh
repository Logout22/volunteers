#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

sed "\
        s/backends.postgresql_psycopg2/backends.sqlite3/; \
        s/'NAME': '\([a-z]\+\)'/'NAME': '\1.db'/; \
    " \
    volunteer_mgmt/localsettings_example.py \
    > volunteer_mgmt/localsettings.py

. venv/bin/activate
./manage.py migrate
./manage.py collectstatic
./manage.py createsuperuser --noinput --username test --email me@fosdem.org

