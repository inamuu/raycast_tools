#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title gh
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "dropdown", "placeholder": "select gh command", "data" : [{"title": "review-requested@me", "value": "review-requested@me"}] }

# Optional parameters:
# @raycast.icon 🤖

rvme() {
  gh api graphql -f query='
{
  search(query: "is:open is:pr review-requested:@me", type: ISSUE, first: 100) {
    nodes {
      ... on PullRequest {
        title
        number
        url
        repository {
          nameWithOwner
        }
      }
    }
  }
}' | jq -r '.data.search.nodes[] | "\(.repository.nameWithOwner) #\(.number): \(.title) - \(.url)"'
}

case $1 in
  review-requested@me)
    rvme
    ;;
  *)
    echo "Invalid command"
    exit 1
    ;;
esac
