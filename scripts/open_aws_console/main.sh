#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title open_aws_console
# @raycast.mode compact
# @raycast.needsConfirmation true
# @raycast.argument1 { "type": "dropdown", "placeholder": "region", "data" : [{"title": "tokyo", "value": "ap-northeast-1"}] }
# @raycast.argument2 { "type": "dropdown", "placeholder": "services", "data" : [{"title": "ec2", "value": "ec2"}, {"title": "ecs", "value": "ecs/v2/clusters"}, {"title": "route53", "value": "route53/v2/home"}, {"title": "vpc", "value": "vpcconsole"}] }

# Optional parameters:
# @raycast.icon 🤖

open https://"$1".console.aws.amazon.com/$2?region=$1
