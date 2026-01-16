#!/bin/sh

set -e

WAYBAR_BASE_URL=https://raw.githubusercontent.com/basecamp/omarchy/refs/heads/master/config/waybar/config.jsonc


jq -s '.[0] * .[1]' <(curl -fsSL "$WAYBAR_BASE_URL") override.jsonc > ~/.config/waybar/config.jsonc
