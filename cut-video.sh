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
NAME=$(basename "$VIDEO")
QTD_PONTOS=$(( $(ls "$NAME" | tr '.' '\n' | wc -l) -1 ))
ffmpeg -i "$VIDEO" -vcodec copy -acodec copy -ss $START -t $END \
    "$( echo $NAME | cut -d'.' -f1-${QTD_PONTOS} )"_part0${4:-1}.${NAME/*.}
