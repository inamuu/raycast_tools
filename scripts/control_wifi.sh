#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title control wifi
# @raycast.mode compact
# @raycast.needsConfirmation false

# Optional parameters:
# @raycast.icon 🛜

WIFINIC=$(networksetup -listallhardwareports | grep -A 1 "Wi-Fi" | tail -1 | awk '{print $(NF-0)}')

networksetup -SetAirportPower ${WIFINIC} off
networksetup -SetAirportPower ${WIFINIC} on

