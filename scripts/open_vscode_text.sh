#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title open_vscode_text
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

cd ${HOME}/Downloads
code -n ${HOME}/Downloads/$(date +%Y%m%d).txt
