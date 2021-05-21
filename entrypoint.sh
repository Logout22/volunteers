#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

cd /
./run-tests.sh
cd "$GITHUB_WORKSPACE"
cp /.coverage ./

