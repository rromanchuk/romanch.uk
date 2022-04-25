#!/usr/bin/env bash
set -euxo pipefail
source /home/ubuntu/.env
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails assets:precompile
aws s3 sync public/assets s3://personal-www/assets --storage-class INTELLIGENT_TIERING --cache-control max-age=31536000

exit 0