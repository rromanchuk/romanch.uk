#!/bin/bash
set -e

REVISION=$(git rev-parse HEAD)
LOG=$(git log -5 --pretty=reference)

aws deploy create-deployment \
    --application-name romanch.uk \
    --deployment-config-name CodeDeployDefault.AllAtOnce \
    --deployment-group-name production \
    --description "$LOG" \
    --github-location repository=rromanchuk/ryanromanchuk.com,commitId="$REVISION" \
    --profile ryan \
    --output text