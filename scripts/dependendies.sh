#!/usr/bin/env bash

apt-get update

apt-get install -y supervisor nginx git gcc g++ make python-dev python-pip libxml2-dev libxslt1-dev zlib1g-dev ruby-sass gettext curl
pip install --upgrade pip
