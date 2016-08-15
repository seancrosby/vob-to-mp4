#!/bin/bash

# Converts VOB files (found on DVDs) to MP4s using ffmpeg.  
#  ffmpeg website: https://www.ffmpeg.org
#  ubuntu installation instructions: https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

if [ $# -ne 2 ]; then
    echo $0: usage: convert-vob-to-mp4.sh src-dir dst-dir
    exit 1
fi

SRC=$1
DST=$2

for f in $SRC/*.VOB
do
  # strip off directories
  s=${f##*/}

  # convert video
  echo "### Processing $f file... (will save to ${DST}/${s%.*}.mp4)"
  ~/bin/ffmpeg -i $f -ac 2 -ab 128k -vcodec libx264 -crf 20 -threads 0 "${DST}/${s%.*}.mp4"  
done
