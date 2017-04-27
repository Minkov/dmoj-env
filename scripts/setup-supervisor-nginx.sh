#!/usr/bin/env bash

FILES_DIR="$1"

cp "$FILES_DIR"/site.conf /etc/supervisor/conf.d/site.conf
cp "$FILES_DIR"/bridged.conf /etc/supervisor/conf.d/bridged.conf
cp "$FILES_DIR"/nginx.conf /etc/nginx/conf.d/nginx.conf

sudo systemctl restart supervisor
sudo systemctl reload-or-restart nginx
