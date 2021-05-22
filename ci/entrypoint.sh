#!/bin/sh
set -o errexit
set -o nounset

mkdir -p logs tool/media/mugshots
sqlite3 volunteers.db
sqlite3 penta.db
python3 -m venv venv
ci/install-dependencies.sh
ci/setup-server.sh
./run-tests.sh

