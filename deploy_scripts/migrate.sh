#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails db:migrate

exit 0