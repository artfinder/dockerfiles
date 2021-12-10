#! /bin/sh

# exit if a command fails
set -eo pipefail

apk update

# install pg_dump
apk add postgresql
apk add postgresql-jit

# install s3 tools
apk add python3 py3-pip
pip install awscli
apk del py3-pip

# cleanup
rm -rf /var/cache/apk/*
