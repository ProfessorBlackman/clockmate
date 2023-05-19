#!/bin/bash


# Clockify API endpoint
API_ENDPOINT="https://api.clockify.me/api/v1/workspaces/"
# {workspaceId}/time-entries
# Your Clockify API key
echo 'enter your clockify api key:'
read api_key
API_KEY="$api_key"
echo "$api_key" >> clockify_details.txt

# ID of the workspace to track time in
echo 'enter your workspace id:'
read workspace_id
WORKSPACE_ID="$workspace_id"
echo "$workspace_id" >> clockify_details.txt

# ID of the project to track time for
echo 'enter your project id:'
read project_id
PROJECT_ID="$project_id"
echo "$project_id" >> clockify_details.txt

# Description of the time entry
echo 'when clockify starts automatically what would you like to be the description'
read description
DESCRIPTION="$description"
echo "$description" >> clockify_details.txt

