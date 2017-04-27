#!/usr/bin/env bash

VIRTUALENV_PATH="$1"

pip install virtualenv
rm -r "$VIRTUALENV_PATH"
mkdir -p "$VIRTUALENV_PATH"

virtualenv -p python "$VIRTUALENV_PATH"
# source /envs/dmoj/bin/activate
