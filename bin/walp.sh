#!/bin/bash
RANDOM_WALLPAPER=$(find "/home/pawel/o/pics/wallpapers" -type f | sort -R | tail -1)
wal -i  $RANDOM_WALLPAPER -a 80
