#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"

cd /var/www/romanch.uk/codedeploy
ln -s /home/ubuntu/assets public/assets


ln -s /home/ubuntu/tmp tmp
ln -s /home/ubuntu/log log
ln -s /home/ubuntu/node_modules node_modules
ln -s /home/ubuntu/master.key config/master.key -f

bundle install
#bundle clean

bin/rails assets:precompile
aws s3 sync public/assets s3://personal-www/assets --storage-class INTELLIGENT_TIERING --cache-control max-age=31536000

bin/rails db:migrate

cd /var/www/romanch.uk/
mv /var/www/romanch.uk/codedeploy /var/www/romanch.uk/"$DEPLOYMENT_ID"
rm -f current
ln -s "$DEPLOYMENT_ID" current

cd /var/www/romanch.uk/current

sudo systemctl start nginx
sudo systemctl restart puma
#sudo systemctl restart sidekiq
#sudo systemctl restart anycable-rpc


bin/rails sitemap:refresh:no_ping
aws s3 sync public/sitemaps s3://personal-www/sitemaps --storage-class INTELLIGENT_TIERING 

exit 0