#!/bin/sh

batteryLvl=$(cat /sys/class/power_supply/BAT1/capacity)

if [ $batteryLvl -lt 10 ]
then
notify-send "Battery is low " -u CRITICAL
fi
