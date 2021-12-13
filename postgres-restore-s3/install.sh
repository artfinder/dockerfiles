#! /bin/sh

# exit if a command fails
set -eo pipefail

apk update

# install pg_dump
apk add postgresql --no-cache
apk add postgresql-jit --no-cache

# install s3 tools
apk add python3 py3-pip py3-six py3-urllib3 py3-colorama --no-cache
pip install --upgrade --no-cache-dir awscli
apk del py3-pip

# cleanup
rm -rf /var/cache/apk/*

# check image
aws --version
