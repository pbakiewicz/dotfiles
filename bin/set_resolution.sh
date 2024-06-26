#!/bin/bash


# killing polybar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Check if DP-1 is connected
if xrandr | grep "HDMI-1-0 connected"; then
	xrandr --output eDP-1 --off
    xrandr --output HDMI-1-0 --mode 3440x1440 --rate 99.90
	polybar krzywy &
elif xrandr | grep "DP-1 connected" | grep -v "eDP-1"; then
	xrandr --output eDP-1 --off
	polybar krzywy &
elif xrandr | grep "DP-4 connected"; then
    # dla desktopa
    xrandr --output DP-4 --mode 3440x1440 --rate 99.90
    polybar krzywy &
else
	polybar laptop &
fi

# Ustawianie wallpapera bo inaczej jest krzywy.
feh --bg-center "$(find $HOME/o/wallpapers/3440x1440/ -type f | shuf -n1)"

