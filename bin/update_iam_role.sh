#!/bin/sh
set -euxo pipefail;
source .env
cd conf/iam
tsc iam.ts && node iam.js > iam.json && rm iam.js

oldVersions="$(aws iam list-policy-versions --policy-arn "$EC2_IAM_ROLE" --profile "$AWS_PROFILE" --output json | jq -r ".Versions[] | select(.IsDefaultVersion==false) | .VersionId")";
for pv in $oldVersions; do
  aws iam delete-policy-version --profile "$AWS_PROFILE" --policy-arn "$EC2_IAM_ROLE" --version-id "$pv";
done;

aws iam create-policy-version \
 --policy-arn $EC2_IAM_ROLE \
 --policy-document file://iam.json --set-as-default --profile $AWS_PROFILE

rm iam.json

exit 0;