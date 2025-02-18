#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"


sudo mkdir -p /var/www/romanch.uk
sudo chown ubuntu:ubuntu /var/www/romanch.uk

sudo rm -rf /var/www/romanch.uk/codedeploy
mkdir -p /var/www/romanch.uk/codedeploy


mkdir -p /home/ubuntu/shared_bundle
mkdir -p /home/ubuntu/assets
mkdir -p /home/ubuntu/node_modules
mkdir -p /home/ubuntu/log
mkdir -p /home/ubuntu/storage
mkdir -p /home/ubuntu/tmp/sockets
sudo chown -R ubuntu:ubuntu /home/ubuntu/tmp/

cd /var/www/romanch.uk/codedeploy


bundle config --global deployment true
bundle config set --global path /home/ubuntu/shared_bundle
bundle config set --local path /home/ubuntu/shared_bundle

exit 0