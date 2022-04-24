#!/bin/bash
set -eo pipefail
source /home/ubuntu/.env

cd /var/www/romanch.uk/codedeploy
bin/rails db:migrate