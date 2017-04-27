#!/usr/bin/env bash

SITE_DIR="$1"
cd "$SITE_DIR"

# source /envs/dmoj/bin/activate
pip install -r requirements.txt
pip install mysqlclient
python manage.py check
python manage.py migrate

./make_style.sh

echo "yes" | python manage.py collectstatic
python manage.py compilemessages
python manage.py compilejsi18n
python manage.py loaddata navbar
python manage.py loaddata language_small
