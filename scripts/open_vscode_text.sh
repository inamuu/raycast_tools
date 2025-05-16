#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title open-vscode-terminal
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

cd ${HOME}/Downloads
code ${HOME}/Downloads/$(date +%Y%m%d).txt
