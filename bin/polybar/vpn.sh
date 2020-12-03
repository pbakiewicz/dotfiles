#!/bin/bash
status=$(nordvpn status)
# bash regex =~
if [[ $status =~ "Connected" ]]
then
    echo ""
else
    echo ""
fi
