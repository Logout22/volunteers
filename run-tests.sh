#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

. venv/bin/activate
echo " ##### Run linter #####"
DJANGO_SETTINGS_MODULE=volunteer_mgmt.settings pylint --load-plugins pylint_django --fail-under=7 volunteers/
echo " ##### Run test #####"
./manage.py test

