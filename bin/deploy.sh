#!/bin/sh
set -euxo pipefail;
source .env
REVISION=$(git rev-parse HEAD)
LOG=$(git log -5 --pretty=reference)

aws deploy create-deployment \
    --application-name personal \
    --deployment-config-name CodeDeployDefault.AllAtOnce \
    --deployment-group-name production \
    --description "$LOG" \
    --github-location repository=rromanchuk/ryanromanchuk.com,commitId="$REVISION" \
    --profile "$AWS_PROFILE" \
    --output text