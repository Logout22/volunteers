#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

if [ $UID != 0 ]; then
    sudo "$0" "$@"
    exit
fi

docker build --pull -t volunteers-test .
docker run -v "$PWD:$PWD" --rm --name volunteers-test -ti volunteers-test "$@"

