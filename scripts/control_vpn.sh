#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title control vpn
# @raycast.mode compact
# @raycast.needsConfirmation false
# @raycast.argument1 { "type": "dropdown", "placeholder": "control", "data" : [{"title": "start", "value": "start"},{"title": "stop", "value": "stop"},{"title": "restart", "value": "restart"}] }
# @raycast.argument2 { "type": "dropdown", "placeholder": "select vpn", "data" : [{"title": "VPN_1", "value": "VPN_1"},{"title": "VPN_2", "value": "VPN_2"},{"title": "VPN_3", "value": "VPN_3"},{"title": "VPN_4", "value": "VPN_4"}] }

# Optional parameters:
# @raycast.icon 🌐

case $1 in
  start|stop)
    scutil --nc "$1" "$2"
    ;;
  restart)
    scutil --nc stop "$2"
    scutil --nc start "$2"
    ;;
  *)
    echo "Invalid command"
    exit 1
    ;;
esac
