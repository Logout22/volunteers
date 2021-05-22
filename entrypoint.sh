#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

mkdir -p logs tool/media/mugshots
sqlite3 volunteers.db
sqlite3 penta.db
python3 -m venv venv
./install-dependencies.sh
./setup-server.sh
./run-tests.sh

