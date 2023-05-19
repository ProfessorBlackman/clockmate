#!/bin/bash

DESCRIPTION=$(head -n 4 clockify_details.txt)
PROJECT_ID=$(head -n 3 clockify_details.txt)
WORKSPACE_ID=$(head -n 2 clockify_details.txt)
API_KEY=$(head -n 1 clockify_details.txt)

# Get current timestamp
START_TIME=$(date +%Y-%m-%dT%H:%M:%SZ)

# Build the JSON payload for the request
JSON_PAYLOAD=$(cat <<EOF
{
  "start": "$START_TIME",
  "billable": true,
  "description": "$DESCRIPTION",
  "projectId": "$PROJECT_ID",
  "workspaceId": "$WORKSPACE_ID"
}
EOF
)

# Make the request to start a new time entry
response=$(curl -s -X POST -H "Content-Type: application/json" -H "X-Api-Key: $API_KEY" -d "$JSON_PAYLOAD" -w "%{http_code}" "$https://api.clockify.me/api/v1/workspaces/$WORKSPACE_ID/time-entries")

# Check if the request was successful
# if [ "$response" -eq 201]; then
#   echo "Time entry started successfully."
# else
#   echo "Failed to start time entry. Error: $response"
# fi
echo $response

