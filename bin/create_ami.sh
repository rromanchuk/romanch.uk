#!/bin/sh
set -euxo pipefail;
eval "$(bin/shdotenv)"
REVISION=$(git rev-parse --short HEAD)


instanceId="$(aws ec2 describe-instances --profile "$AWS_PROFILE" --output json | jq -r ".Reservations[].Instances[0].InstanceId")"
imageId="$(aws ec2 create-image --no-reboot --instance-id "$instanceId" --name "$REVISION" --profile "$AWS_PROFILE" --output json | jq ".ImageId")"
sourceVersion="$(aws ec2 describe-launch-template-versions --launch-template-name personal --profile "$AWS_PROFILE" --output json | jq -r ".LaunchTemplateVersions[0].VersionNumber")"

aws ec2 create-launch-template-version \
  --launch-template-name personal 
  --version-description $REVISION \
  --source-version $sourceVersion \
  --launch-template-data ImageId=${imageId} \
  --profile $AWS_PROFILE | jq '.'

echo "Created image $imageId"

exit 0