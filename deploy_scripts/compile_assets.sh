#!/bin/bash
set -e
#export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"
source /home/ubuntu/.bashrc
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails assets:precompile
aws s3 sync public/assets s3://ryanromanchuk-www/assets --storage-class INTELLIGENT_TIERING --cache-control max-age=31536000