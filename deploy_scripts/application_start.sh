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

bin/rails sitemap:refresh:no_ping
aws s3 sync public/sitemaps s3://personal-www/sitemaps --storage-class INTELLIGENT_TIERING 


exit 0