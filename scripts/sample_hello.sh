#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title sample_hello
# @raycast.mode compact
# @raycast.needsConfirmation true
# @raycast.argument1 { "type": "text", "placeholder": "from city", "percentEncoded": true }

# Optional parameters:
# @raycast.icon 🤖

echo "hello world $1"
