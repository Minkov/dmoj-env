#!/usr/bin/env bash

LOGS_DIR=/vagrant/logs

DMOJ_DIR=/vagrant/dmoj
SITE_DIR=$DMOJ_DIR/site
FILES_DIR=/vagrant/files
VIRTUALENV_PATH=/envs/dmoj

show_msg() {
	echo "--- $1 ---"
}

launch_script() {
	local script="$1"
	shift
	local params=("$@")

	bash "/vagrant/scripts/$script" "${params[@]}" \
		&> "$LOGS_DIR/$script.log"
}

show_msg "Find all logs in /vagrant/logs"
rm -r "$LOGS_DIR"
mkdir -p "$LOGS_DIR"

show_msg "Installing apt-get dependendies"
launch_script dependendies.sh

show_msg "Installing Node.js"
launch_script node.js.sh

show_msg "Installing Node.js packages"
launch_script node.js-packages.sh

show_msg "Installing and Setting up MySQL"
launch_script mysql.sh

show_msg "Installing Node.js packages"
launch_script node.js-packages.sh

show_msg "Setup virtualenv"
launch_script virtualenv-setup.sh "$VIRTUALENV_PATH"

sudo chown -R vagrant:vagrant "$VIRTUALENV_PATH"

source "$VIRTUALENV_PATH/bin/activate"

show_msg "Checkout web app"
launch_script checkout-app.sh "$SITE_DIR"

show_msg "Setup web app"
launch_script setup-app.sh "$SITE_DIR"

mkdir -p /vagrant/files
cd /vagrant/files

curl http://uwsgi.it/install | bash -s default "$PWD/uwsgi" >> "$LOGS_DIR/uwsgi.log"

show_msg "Setup Supervisor and nginx"
launch_script setup-supervisor-nginx.sh "$FILES_DIR"
