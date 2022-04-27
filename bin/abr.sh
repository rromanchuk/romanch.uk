
#!/bin/bash
set -e


while getopts "k" opt
do
   case "$opt" in
      k ) KEY="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

ffmpeg -hide_banner -y -i $KEY \
    -filter_complex "[0:v:0]split=3[SPLIT_1][SPLIT_2][SPLIT_3] ; [SPLIT_1]scale=width=-2:height=720[VIDEO_HEVC_720] ; [SPLIT_2]scale=width=-2:height=1080[VIDEO_HEVC_1080] ; [SPLIT_3]scale=width=-2:height=1080[VIDEO_AVC_1080]" \
    -preset 'veryfast' -pix_fmt:v 'yuv420p' \
    -flags +cgop -g 60 -x265-params:v bframes=0:keyint=60:min-keyint=60  \
    -map '[VIDEO_HEVC_720]' -codec:v:0 'libx265' -forced-idr:v:0 1 -tag:v:0 hvc1 -crf:v:0 30 -maxrate:v:0 1000k -bufsize:v:0 2000k  \
    -map '[VIDEO_HEVC_1080]' -codec:v:1 'libx265' -forced-idr:v:1 1 -tag:v:1 hvc1 -crf:v:1 30 -maxrate:v:1 5000k -bufsize:v:1 10000k  \
    -map '[VIDEO_AVC_1080]' -keyint_min:v:2 60 -codec:v:2 'libx264' -crf:v:2 23 -maxrate:v:2 4000k -bufsize:v:2 8000k \
    -map '0:a:0' -codec:a copy \
    -f "hls" -hls_time 6 -hls_segment_type 'fmp4' -hls_flags '+single_file' -hls_playlist_type 'vod' -var_stream_map "a:0,name:AUDIO,agroup:common_audio,default:YES,language:ENG v:0,name:HEVC720,agroup:common_audio v:1,name:HEVC1080,agroup:common_audio v:2,name:AVC1080,agroup:common_audio" \
    -master_pl_name 'master.m3u8' \
    -hls_segment_filename 'out/%v.mp4' 'out/%v.m3u8'


ffmpeg -hide_banner -y -i ignore/l35.mov \
    -filter_complex "[0:v:0]split=3[SPLIT_1][SPLIT_2][SPLIT_3] ; [SPLIT_1]scale=width=-2:height=720[VIDEO_HEVC_720] ; [SPLIT_2]scale=width=-2:height=1080[VIDEO_HEVC_1080] ; [SPLIT_3]scale=width=-2:height=1080[VIDEO_AVC_1080]" \
    -preset 'veryfast' -pix_fmt:v 'yuv420p' \
    -flags +cgop -g 60 -x265-params:v bframes=0:keyint=60:min-keyint=60  \
    -map '[VIDEO_HEVC_720]' -codec:v:0 'libx265' -forced-idr:v:0 1 -tag:v:0 hvc1 -crf:v:0 30 -maxrate:v:0 1000k -bufsize:v:0 2000k  \
    -map '[VIDEO_HEVC_1080]' -codec:v:1 'libx265' -forced-idr:v:1 1 -tag:v:1 hvc1 -crf:v:1 30 -maxrate:v:1 5000k -bufsize:v:1 10000k  \
    -map '[VIDEO_AVC_1080]' -keyint_min:v:2 60 -codec:v:2 'libx264' -crf:v:2 23 -maxrate:v:2 4000k -bufsize:v:2 8000k \
    -map '0:a:0' -codec:a copy \
    -f "hls" -hls_time 6 -hls_segment_type 'fmp4' -hls_flags '+single_file' -hls_playlist_type 'vod' -var_stream_map "a:0,name:AUDIO,agroup:common_audio,default:YES,language:ENG v:0,name:HEVC720,agroup:common_audio v:1,name:HEVC1080,agroup:common_audio v:2,name:AVC1080,agroup:common_audio" \
    -master_pl_name 'master.m3u8' \
    -hls_segment_filename 'out/%v.mp4' 'out/%v.m3u8'