#!/bin/bash
# cut video / split video
# need file and start/end part
#==================================
source /opt/scripts/libs/util.lib || exit
_checkDependences 'ffmpeg'
VIDEO="$1"
_file "$VIDEO"
START="$2"
END="$3"
QTD=$(( $(echo $VIDEO | tr '.' '\n' | wc -l) -1 ))
ffmpeg -i "$VIDEO" -vcodec copy -acodec copy -ss $START -t $END \
    "$( echo $VIDEO | cut -d'.' -f1-${QTD} )"_part0${4:-1}.${VIDEO/*.}
