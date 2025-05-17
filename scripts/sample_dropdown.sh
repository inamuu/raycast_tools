#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title sample_dropdown
# @raycast.mode compact
# @raycast.needsConfirmation true
# @raycast.argument1 { "type": "dropdown", "placeholder": "on/off", "data" : [{"title": "on", "value": "true"}, {"title": "off", "value": "false"}] }

# Optional parameters:
# @raycast.icon 🤖

echo "switch $1"
