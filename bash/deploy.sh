#!/bin/bash

set -e

PI_USER="mariusz"
PI_HOST="raspberry"
APP_DIR="/home/mariusz/projects/waste-reminder"
SERVICE_NAME="waste-reminder.service"


echo "=== Deploy on Raspberry Pi ==="
ssh ${PI_USER}@${PI_HOST} << EOF
set -e
cd ${APP_DIR} || exit 1
git pull
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
# sudo systemctl restart ${SERVICE_NAME}
# sudo systemctl status ${SERVICE_NAME} --no-pager
EOF

echo "=== Deploy finished ==="