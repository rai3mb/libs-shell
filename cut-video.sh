#!/bin/bash

VIDEO="$1"
[ -f "$VIDEO" ] || exit 1
START="$2"
END="$3"
QTD=$(( $(echo $VIDEO | tr '.' '\n' | wc -l) -1 ))
ffmpeg -i "$VIDEO" -vcodec copy -acodec copy -ss $START -t $END "$( echo $VIDEO | cut -d'.' -f1-${QTD} )"_part0${4:-1}.${VIDEO/*.}

