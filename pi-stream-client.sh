#!/usr/bin/env bash
raspivid -n -vf -hf -t 0 -w 960 -h 540 -fps 25 -b 500000 -o - | ffmpeg -i - -vcodec copy -an -metadata title="Machine 01 Camera Stream" -g 10 -keyint_min 1 -preset UltraFast -tune zerolatency -crf 25 -an -r 3 -f flv rtmp://192.168.1.10:1935/live/machine01