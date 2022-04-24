#!/bin/sh
set -euxo pipefail;
source /home/ubuntu/.env

cd /var/www/romanch.uk/codedeploy
bin/rails db:migrate