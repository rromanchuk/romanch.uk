#!/bin/bash
set -e
export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"
source /home/ubuntu/.bashrc
printenv


sudo mkdir -p /var/www/romanch.uk
sudo chown ubuntu:ubuntu /var/www/romanch.uk

rm -rf /var/www/romanch.uk/codedeploy
mkdir -p /var/www/romanch.uk/codedeploy/public
mkdir -p /var/www/romanch.uk/codedeploy/config

mkdir -p /home/ubuntu/shared_bundle
mkdir -p /home/ubuntu/assets
mkdir -p /home/ubuntu/node_modules
mkdir -p /home/ubuntu/log
mkdir -p /home/ubuntu/tmp/sockets
sudo chown -R ubuntu:ubuntu /home/ubuntu/tmp/

cd /var/www/romanch.uk/codedeploy

ln -s /home/ubuntu/assets public/assets
ln -s /home/ubuntu/tmp tmp
ln -s /home/ubuntu/log log
ln -s /home/ubuntu/node_modules node_modules
ln -s /home/ubuntu/master.key config/master.key -f

rbenv global 3.1.0
gem install bundler

bundle config --global deployment true
bundle config set --global path /home/ubuntu/shared_bundle
bundle config set --local path /home/ubuntu/shared_bundle
