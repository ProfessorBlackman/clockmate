#!/bin/bash

API_KEY="OTgwZGY2Y2MtOTYwNS00OWRhLWI3NDUtOTk3MjA2M2MxYjMx"
WORKSPACE_ID="6462750572c4a57b33b649d8"
PROJECT_ID="6462770a72c4a57b33b67048"

# Current time in ISO 8601 format
START_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Request body
DATA=$(cat <<EOF
{
  "start": "$START_TIME",
  "billable": true,
  "projectId": "$PROJECT_ID"
}
EOF
)

# Make API request to start a new time entry
curl -X POST \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "$DATA" \
  "https://api.clockify.me/api/v1/workspaces/$WORKSPACE_ID/timeEntries"

echo "New time entry started!"

