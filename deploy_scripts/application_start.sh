#!/usr/bin/env bash
set -euxo pipefail
source /home/ubuntu/.env
export DATABASE_URL="$DATABASE_URL"
export RAILS_ENV="$RAILS_ENV"
export PATH="$PATH"
printenv


cd /var/www/romanch.uk/
mv /var/www/romanch.uk/codedeploy /var/www/romanch.uk/"$DEPLOYMENT_ID"
rm -f current
ln -s "$DEPLOYMENT_ID" current

cd /var/www/romanch.uk/current

sudo systemctl start nginx
sudo systemctl restart puma

exit 0