#!/bin/bash
set -e

source /home/ubuntu/.bashrc
printenv
#export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"

cd /var/www/romanch.uk/codedeploy
RAILS_ENV=production bundle install 