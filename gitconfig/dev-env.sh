#!/bin/bash
# file: dev-env.sh
# description: build local test environment for testing git alias operations
#
# @author Derek Garcia
ENV_NAME=git-test

# build image if dne
docker image ls | grep -qE "$ENV_NAME "
[ "$?" -eq 1 ] && docker build -t "$ENV_NAME" .

docker run --rm -it "$ENV_NAME"