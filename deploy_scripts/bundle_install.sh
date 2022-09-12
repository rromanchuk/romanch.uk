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
bundle clean


exit 0