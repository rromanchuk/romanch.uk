#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails assets:precompile
bin/rails sitemap:refresh

aws s3 sync public/assets s3://personal-www/assets --storage-class INTELLIGENT_TIERING --cache-control max-age=31536000
aws s3 cp public/sitemap.xml s3://personal-www/sitemap.xml --content-type 'text/xml'

exit 0