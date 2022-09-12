#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"

printenv


cd /var/www/romanch.uk/
mv /var/www/romanch.uk/codedeploy /var/www/romanch.uk/"$DEPLOYMENT_ID"
rm -f current
ln -s "$DEPLOYMENT_ID" current

cd /var/www/romanch.uk/current

sudo systemctl start nginx
sudo systemctl restart puma
sudo systemctl restart sidekiq
sudo systemctl restart anycable-rpc

bundle exec whenever --update-crontab

# bin/rails sitemap:refresh
# aws s3 cp public/sitemap.xml s3://personal-www/sitemap.xml --content-type 'text/xml'

exit 0