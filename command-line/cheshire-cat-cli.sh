#!/bin/bash

# Define usage message
usage() {
  echo "Usage: $0 [-h] TEXT"
  echo "Send TEXT to cheshire cat websocket located in ws://localhost:1865/ws, extract the 'content' field from the JSON response, and return it."
  echo "Options:"
  echo "  -h, --help    Show this help message and exit"
}

# Parse command line options
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -h|--help)
      usage
      exit 0
      ;;
    *)
      text="$1"
      shift
      ;;
  esac
done

# Read from pipe if no argument was provided
if [ -t 0 ] && [ -z "$text" ]; then
  echo "Error: No text provided"
  usage
  exit 1
elif [ -z "$text" ]; then
  text=$(cat -)
fi

# Send text to websocket and extract content field from JSON response
json=$(echo "{\"text\": \"$text\"}" | websocat -n1 ws://localhost:1865/ws)
content=$(echo "$json" | jq -r '.content')

# Return content field
echo "$content"
