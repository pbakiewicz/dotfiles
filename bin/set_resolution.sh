#!/bin/bash


# killing polybar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Check if DP-1 is connected
if xrandr | grep "DP-1 connected" | grep -v "eDP-1"; then
	xrandr --output eDP-1 --off
	polybar krzywy &
else
	polybar laptop &
fi
