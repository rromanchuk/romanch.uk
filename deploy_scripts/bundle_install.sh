#!/bin/bash
set -e
#export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"
source /home/ubuntu/.bashrc
printenv

cd /var/www/romanch.uk/codedeploy
RAILS_ENV=production bundle install 