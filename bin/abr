
#!/bin/bash
set -euxo pipefail;


while getopts "k:" opt
do
   case "$opt" in
      k ) KEY="$OPTARG" ;;
      *)
        echo "./abr -k path/to/source.mov"
        exit 1
        ;;
   esac
done

mkdir -p tmp

ffmpeg -ss 00:00:02 -i $KEY -frames:v 1 -q:v 2 tmp/thumbnail.jpg

ffmpeg -hide_banner -y -i $KEY \
    -filter_complex "[0:v:0]split=3[SPLIT_1][SPLIT_2][SPLIT_3] ; [SPLIT_1]scale=width=-2:height=1440[VIDEO_HEVC_1440] ; [SPLIT_2]scale=width=-2:height=1080[VIDEO_HEVC_1080] ; [SPLIT_3]scale=width=-2:height=720[VIDEO_AVC_720]" \
    -preset 'veryfast' -pix_fmt:v 'yuv420p' \
    -flags +cgop -g 60 -x265-params:v bframes=0:keyint=60:min-keyint=60  \
    -map '[VIDEO_HEVC_1440]' -codec:v:0 'libx265' -forced-idr:v:0 1 -tag:v:0 hvc1 -crf:v:0 30 -maxrate:v:0 1000k -bufsize:v:0 2000k  \
    -map '[VIDEO_HEVC_1080]' -codec:v:1 'libx265' -forced-idr:v:1 1 -tag:v:1 hvc1 -crf:v:1 30 -maxrate:v:1 5000k -bufsize:v:1 10000k  \
    -map '[VIDEO_AVC_720]' -keyint_min:v:2 60 -codec:v:2 'libx264' -crf:v:2 23 -maxrate:v:2 3000k -bufsize:v:2 6000k \
    -map '0:a:0' -codec:a copy \
    -f "hls" -hls_time 6 -hls_segment_type 'fmp4' -hls_flags '+single_file' -hls_playlist_type 'vod' -var_stream_map "a:0,name:audio,agroup:common_audio,default:YES,language:ENG v:0,name:1440p_hevc,agroup:common_audio v:1,name:1080p_hevc,agroup:common_audio v:2,name:720p_avc,agroup:common_audio" \
    -master_pl_name 'master.m3u8' \
    -hls_segment_filename 'tmp/%v.mp4' 'tmp/%v.m3u8'


exit 0