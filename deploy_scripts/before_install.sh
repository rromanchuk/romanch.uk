#!/usr/bin/env bash
set -euxo pipefail
source /home/ubuntu/.env



sudo mkdir -p /var/www/romanch.uk
sudo chown ubuntu:ubuntu /var/www/romanch.uk

sudo rm -rf /var/www/romanch.uk/codedeploy
mkdir -p /var/www/romanch.uk/codedeploy
# mkdir -p /var/www/romanch.uk/codedeploy/public
# mkdir -p /var/www/romanch.uk/codedeploy/config

mkdir -p /home/ubuntu/shared_bundle
mkdir -p /home/ubuntu/assets
mkdir -p /home/ubuntu/node_modules
mkdir -p /home/ubuntu/log
mkdir -p /home/ubuntu/tmp/sockets
sudo chown -R ubuntu:ubuntu /home/ubuntu/tmp/

cd /var/www/romanch.uk/codedeploy



rbenv global 3.1.0
gem install bundler

bundle config --global deployment true
bundle config set --global path /home/ubuntu/shared_bundle
bundle config set --local path /home/ubuntu/shared_bundle

exit 0