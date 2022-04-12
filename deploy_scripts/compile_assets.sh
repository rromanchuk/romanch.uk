#!/bin/bash
set -e
export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"
source /home/ubuntu/.bashrc
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails assets:precompile