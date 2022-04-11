#!/bin/bash
set -e


export PATH="./bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/bin:$PATH"

cd /var/www/romanch.uk/codedeploy
bundle install 