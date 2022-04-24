#!/bin/sh
set -euxo pipefail;
#export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"
source /home/ubuntu/.env


cd /var/www/romanch.uk/
mv /var/www/romanch.uk/codedeploy /var/www/romanch.uk/"$DEPLOYMENT_ID"
rm -f current
ln -s "$DEPLOYMENT_ID" current

cd /var/www/romanch.uk/current

sudo systemctl start nginx
sudo systemctl restart puma