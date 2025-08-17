#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"


sudo mkdir -p /var/www/romanch.uk
sudo chown ubuntu:ubuntu /var/www/romanch.uk

rm -rf /home/ubuntu/codedeploy
mkdir -p /home/ubuntu/codedeploy


mkdir -p /home/ubuntu/shared_bundle
mkdir -p /home/ubuntu/assets
mkdir -p /home/ubuntu/node_modules
mkdir -p /home/ubuntu/log
mkdir -p /home/ubuntu/tmp/sockets
sudo chown -R ubuntu:ubuntu /home/ubuntu/tmp/



exit 0