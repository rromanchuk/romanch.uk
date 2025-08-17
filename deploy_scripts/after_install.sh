#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"

cd cd /home/ubuntu/codedeploy/romanch.uk
rm -rf log tmp
ln -s /home/ubuntu/assets public/assets
ln -s /home/ubuntu/tmp tmp
ln -s /home/ubuntu/log log
ln -s /home/ubuntu/node_modules node_modules
ln -s /home/ubuntu/master.key config/master.key -f

bundle config --global deployment true
bundle config set --global path /home/ubuntu/shared_bundle
bundle config set --local path /home/ubuntu/shared_bundle

bundle install

bundle exec rails assets:precompile
bundle exec rails db:migrate

aws s3 sync public/assets s3://personal-www/assets --storage-class INTELLIGENT_TIERING --cache-control max-age=31536000


cd /var/www/romanch.uk/
mv /home/ubuntu/codedeploy/romanch.uk /var/www/romanch.uk/"$DEPLOYMENT_ID"
rm -f current
ln -s "$DEPLOYMENT_ID" current


sudo systemctl start nginx
sudo systemctl restart puma


# bin/rails sitemap:refresh:no_ping
# aws s3 sync public/sitemaps s3://personal-www/sitemaps --storage-class INTELLIGENT_TIERING
