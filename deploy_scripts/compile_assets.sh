#!/usr/bin/env bash
set -euxo pipefail
eval "$(shdotenv -e ${HOME}/.env)"
printenv

cd /var/www/romanch.uk/codedeploy
bin/rails assets:precompile
aws s3 sync public/assets s3://personal-www/assets --storage-class INTELLIGENT_TIERING --cache-control max-age=31536000


aws s3 sync videos s3://personal-www/videos \
 --exclude '*' --include '*audio.mp4' \
 --content-type 'audio/mp4'

aws s3 sync public/videos s3://personal-www/videos \
 --exclude '*' --include '*.m3u8' \
 --content-type='application/vnd.apple.mpegurl' 

aws s3 sync public/videos s3://personal-www/videos \
 --exclude '*' --include '*vc.mp4' \
 --content-type='video/mp4' 

aws s3 sync public/videos s3://personal-www/videos \
 --exclude '*' --include '*.jpg'

exit 0