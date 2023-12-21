#!/bin/bash

MAX_VOLUME=150  # maximum volume percentage
CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1)

if [ "$1" == "up" ]; then
    NEW_VOLUME=$((CURRENT_VOLUME + 5))
    if [ $NEW_VOLUME -le $MAX_VOLUME ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    fi
elif [ "$1" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
fi
