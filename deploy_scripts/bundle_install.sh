#!/usr/bin/env bash
set -euxo pipefail
source /home/ubuntu/.env

cd /var/www/romanch.uk/codedeploy
ln -s /home/ubuntu/assets public/assets

rm -rf tmp
ln -s /home/ubuntu/tmp tmp

rm -rf log
ln -s /home/ubuntu/log log

ln -s /home/ubuntu/node_modules node_modules
ln -s /home/ubuntu/master.key config/master.key -f

bundle install 

exit 0