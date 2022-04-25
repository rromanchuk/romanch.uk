#!/usr/bin/env bash
set -euxo pipefail
source /home/ubuntu/.env
export DATABASE_URL="$DATABASE_URL"
export RAILS_ENV="$RAILS_ENV"
export PATH="$PATH"
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails db:migrate

exit 0