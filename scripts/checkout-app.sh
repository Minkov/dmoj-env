#!/usr/bin/env bash

SITE_DIR="$1"

git clone https://github.com/Minkov/site.git "$SITE_DIR"
cd "$SITE_DIR"
git pull
git submodule init
git submodule update
