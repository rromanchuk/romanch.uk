#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"
cd /home/ubuntu/codedeploy
./home/ubuntu/codedeploy/deploy_scripts/after_install.sh
exit 0