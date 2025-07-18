#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Aws Console
# @raycast.mode compact
# @raycast.needsConfirmation false
# @raycast.argument1 { "type": "dropdown", "placeholder": "region", "data" : [{"title": "tokyo", "value": "ap-northeast-1"}] }
# @raycast.argument2 { "type": "dropdown", "placeholder": "services", "data" : [{"title": "cloudfront", "value": "cloudfront/v4/home#/distributions"},{"title": "cloudwatch", "value": "cloudwatch/home"},{"title": "ec2", "value": "ec2/home"},{"title": "ec2/SecurityGroups", "value": "ec2/home#SecurityGroups:"},{"title": "ec2/LoadBalancers", "value": "ec2/home#LoadBalancers:"},{"title": "ecr", "value": "ecr/home"},{"title": "ecs", "value": "ecs/v2/clusters"},{"title": "iam", "value": "iam/home"},{"title": "iam/roles", "value": "iam/home#/roles"},{"title": "iam/policies", "value": "iam/home#/policies"},{"title": "rds", "value": "rds/home"},{"title": "s3", "value": "s3/home"},{"title": "ssm/parameters", "value": "systems-manager/parameters"},{"title": "route53", "value": "route53/v2/home"},{"title": "vpc", "value": "vpcconsole/home"}]}

# Optional parameters:
# @raycast.icon 🤩

open https://"$1".console.aws.amazon.com/$2?region=$1
