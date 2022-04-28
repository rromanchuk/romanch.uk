#!/bin/sh
set -euxo pipefail;

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
which aws
aws --version
rm AWSCLIV2.pkg

exit 0