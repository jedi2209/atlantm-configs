#!/bin/bash

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed. Please install AWS CLI and try again."
  exit 1
fi

rest_api_id=$1
stage_name=$2

if [ -z "$rest_api_id" ]; then
  # Get all available REST API IDs
  rest_api_ids=$(aws apigateway get-rest-apis --query 'items[].id' --output text)

  # Prompt user to choose a REST API ID
  echo "Available REST API IDs:"
  echo "$rest_api_ids" | awk '{print NR".", $0}'
  read -p "Enter the number of the REST API ID: " rest_api_number

  # Validate user input
  if ! [[ "$rest_api_number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
  fi

  # Check if the entered number is within the range of available REST API IDs
  rest_api_count=$(echo "$rest_api_ids" | wc -l)
  if [ "$rest_api_number" -lt 1 ] || [ "$rest_api_number" -gt "$rest_api_count" ]; then
    echo "Invalid number. Please enter a number within the range of available REST API IDs."
    exit 1
  fi

  # Set the selected REST API ID based on the entered number
  rest_api_id=$(echo "$rest_api_ids" | sed -n "${rest_api_number}p")

  # Check if the entered REST API ID is valid
  if ! echo "$rest_api_ids" | grep -q "$rest_api_id"; then
    echo "Invalid REST API ID. Please enter a valid ID."
    exit 1
  fi
fi

# Validate user input
if [ -z "$rest_api_id" ]; then
  echo "REST API ID cannot be empty."
  exit 1
fi

if [ -z "$stage_name" ]; then  
  # Get all available stage names for the selected REST API ID
  stage_names=$(aws apigateway get-stages --rest-api-id "$rest_api_id" --query 'item[].stageName' --output text)

  echo $stage_names;
  read -p "Enter the name of the stage name: " stage_name

  if [ -z "$stage_name" ]; then
    echo "Stage name cannot be empty."
    exit 1
  fi
fi

result=$(aws apigateway update-stage \
  --rest-api-id "$rest_api_id" \
  --stage-name "$stage_name" \
  --no-cli-pager \
  --patch-operations \
    'op=replace,path="/dealer/data/GET/caching/enabled",value=true' \
    'op=replace,path="/dealer/data/GET/caching/ttlInSeconds",value=3600' \
    'op=replace,path="/dealer/data/{dealer+}/GET/caching/enabled",value=true' \
    'op=replace,path="/dealer/data/{dealer+}/GET/caching/ttlInSeconds",value=3600' \
    'op=replace,path="/functions/image-resize/GET/caching/enabled",value=false' \
    'op=replace,path="/functions/redirect/{proxy+}/GET/caching/enabled",value=false' \
    'op=replace,path="/lkk/user/{userID+}/GET/caching/enabled",value=false' \
    'op=replace,path="/mobile/check/version/GET/caching/enabled",value=false' \
    'op=replace,path="/CARS/NEW/SAP/CAR/GET/caching/enabled",value=false' \
    'op=replace,path="/cars/new/sap/car/GET/caching/enabled",value=false' \
    'op=replace,path="/cars/trade-in/sap/car/GET/caching/enabled",value=false' \
    'op=replace,path="/jivo/status/GET/caching/enabled",value=false' \
    'op=replace,path="/jivo/widget/{widgetid+}/GET/caching/enabled",value=false' \
    'op=replace,path="/redirect/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/new/cars/get/car/{id+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/new/cars/get/city/{city+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/new/cars/get/region/{region+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/new/cars/get/dealer/{dealer+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/new/cars/search/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/trade-in/cars/get/car/{id+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/trade-in/cars/get/city/{city+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/trade-in/cars/get/dealer/{dealer+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/trade-in/cars/get/region/{region+}/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/trade-in/cars/search/GET/caching/enabled",value=false' \
    'op=replace,path="/stock/trade-in/cars/search/GET/caching/enabled",value=false')

echo "$result"