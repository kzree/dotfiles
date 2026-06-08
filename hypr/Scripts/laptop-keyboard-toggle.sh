#!/usr/bin/env bash

INTERNAL="at-translated-set-2-keyboard"
STATE_FILE="/tmp/hypr-internal-kbd-disabled"

if [ -f "$STATE_FILE" ]; then
    hyprctl keyword "device[$INTERNAL]:enabled" true
    rm "$STATE_FILE"
    notify-send "Internal keyboard enabled"
else
    hyprctl keyword "device[$INTERNAL]:enabled" false
    touch "$STATE_FILE"
    notify-send "Internal keyboard disabled"
fi
