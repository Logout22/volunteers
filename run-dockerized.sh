#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

if [ $UID != 0 ]; then
    sudo "$0" "$@"
    exit
fi

docker build --pull -t volunteers-test .
ADDITIONAL_ARGS=
EXEC_ARGS=
if [ $# -gt 0 ]; then
    ADDITIONAL_ARGS="--entrypoint $1"
    shift
    EXEC_ARGS="$*"
fi
docker run -v "$PWD:$PWD" --rm --name volunteers-test --workdir "$PWD" -ti $ADDITIONAL_ARGS volunteers-test $EXEC_ARGS

