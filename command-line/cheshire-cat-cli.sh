#!/bin/bash

# Define usage message
usage() {
  echo ""
  echo "Usage: $0 [-h] TEXT"
  echo "Send TEXT to cheshire cat websocket located in ws://localhost:1865/ws, extract the 'content' field from the JSON response, and return it. It works also with pipeline from other commands."
  echo ""
  echo "Options:"
  echo "  -h, --help    Show this help message and exit"
  echo ""
  echo "Examples:"
  echo "./cheshire-cat-cli.sh Hello my friend"
  echo ""
  echo "echo 'Hello my friend' | ./cheshire-cat-cli.sh"
  echo ""
  
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
  echo ""
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
