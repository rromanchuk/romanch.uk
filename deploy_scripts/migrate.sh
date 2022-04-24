#!/usr/bin/env bash
set -euxo pipefail
source /home/ubuntu/.env

cd /var/www/romanch.uk/codedeploy
bin/rails db:migrate

exit 0