#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title switchbot
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "dropdown", "placeholder": "select device", "data" : [{"title": "review-requested@me", "value": "review-requested@me"}] }

# Optional parameters:
# @raycast.icon 🤖

set -ux

source .env

### Create a sign
secret="${SWITCHBOT_SECRET}"
token="${SWITCHBOT_TOKEN}"
t=$(gdate +%s%3N)
nonce=$(uuidgen | tr 'A-Z' 'a-z' | gsed 's/-//g')
message="${token}${t}${nonce}"
sign=$(printf "%s" "$message" | openssl dgst -sha256 -mac HMAC -macopt key:"$secret" -binary | base64)

### Get device list
result=$(
    curl -s "https://api.switch-bot.com/v1.1/devices" \
      --header "Authorization: ${token}" \
      --header "sign: ${sign}" \
      --header "t: ${t}" \
      --header "nonce: ${nonce}" \
      --header "Content-Type: application/json; charset=utf8")

deviceList=$(echo $result | jq ".body.deviceList[]")

### Sample device info
#{
#  "deviceId": "EAE178D6B284",
#  "deviceName": "ハブ２ 84",
#  "deviceType": "Hub 2",
#  "enableCloudService": true,
#  "hubDeviceId": "000000000000"
#}
