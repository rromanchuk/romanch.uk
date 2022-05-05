#!/bin/sh
set -euxo pipefail;
eval "$(bin/shdotenv)"
cd conf/iam
tsc iam.ts && node iam.js > iam.json && rm iam.js

oldVersions="$(aws iam list-policy-versions --policy-arn "$EC2_IAM_ROLE" --profile "$AWS_PROFILE" | 
  jq -r ".Versions[] | 
  select(.IsDefaultVersion==false) | 
  .VersionId")";

for pv in $oldVersions; do
  aws iam delete-policy-version --policy-arn "$EC2_IAM_ROLE" --version-id "$pv";
done;

aws iam create-policy-version \
 --policy-arn $EC2_IAM_ROLE \
 --policy-document file://iam.json --set-as-default | jq '.'

rm iam.json

exit 0;