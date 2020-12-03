#!/bin/bash
if [[ $(nordvpn status) =~ "Connected" ]]
then
				nordvpn disconnect
else
				nordvpn connect
fi
