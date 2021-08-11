#!/usr/bin/env bash
PR_LINK="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/pulls"

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
        \"text\":\"New PR created on ${GITHUB_REPOSITORY}\"
        }
      \"accessory\":{
        \"type\":\"button\",
        \"text\":{
          \"type\":\"plain_text\",
          \"text\":\"View PRs\",
          \"emoji\":true
        },
        \"value\":\"click_me_pull\",
        \"url\":\"${PR_LINK}\",
        \"action_id\":\"button-action\"
        }
      },{
      \"type\":\"section\",
      \"fields\":[
        {
          \"type\":\"mrkdwn\",
          \"text\":\"*Project*\n<https://dashboard.tugboat.qa/$TUGBOAT_PROJECT_ID|$TUGBOAT_PROJECT>\"
        },
        {
          \"type\":\"mrkdwn\",
          \"text\":\"*Service*\n<https://dashboard.tugboat.qa/$TUGBOAT_SERVICE_ID|$TUGBOAT_SERVICE>\"
        }]
      },{
      \"type\":\"section\",
      \"fields\":[
        {
          \"type\":\"mrkdwn\",
          \"text\":\"*Repository*\n<https://github.com/$TUGBOAT_REPO|$TUGBOAT_GITHUB_REPO>\"
        },
        {
          \"type\":\"mrkdwn\",
          \"text\":\"*Commit*\n<https://github.com/$TUGBOAT_REPO/tree/$TUGBOAT_PREVIEW_SHA|$TUGBOAT_PREVIEW_SHA>\"
        }
      ]
    }]
  }" ${SLACK_URL}

