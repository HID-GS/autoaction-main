#!/usr/bin/env bash
PR_LINK="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/pulls"

if [ ${SLACK_URL:-UNDEFINED} == "undefined" ]; then
  echo "missing slack url variable"
  exit
fi

curl -s -X POST -d "payload={
    \"blocks\":[{
      \"type\":\"header\",
      \"text\":{
          \"type\":\"plain_text\",
          \"text\":\"Auto PR on Parent\",
          \"emoji\":true
        }
      },{
      \"type\":\"section\",
      \"text\":{
        \"type\":\"mrkdwn\",
        \"text\":\"New PR created on $GITHUB_REPOSITORY\"
        },
      \"accessory\":{
        \"type\":\"button\",
        \"text\":{
          \"type\":\"plain_text\",
          \"text\":\"View PRs\",
          \"emoji\":true
        },
        \"value\":\"click_me_pull\",
        \"url\":\"$PR_LINK\",
        \"action_id\":\"button-action\"
        }
      }]
    }" ${SLACK_URL}

