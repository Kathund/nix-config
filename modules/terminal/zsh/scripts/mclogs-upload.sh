#!/usr/bin/env bash

# Either "URL" or "RAW"
should_copy="${1:-RAW}"

input=$(cat)
json_content=$(jq -Rn --arg data "$input" '{content: $data}')
response=$(curl -s -X POST https://api.mclo.gs/1/log \
  -H "Content-Type: application/json" \
  -d "$json_content")

url=$(echo "$response" | jq -r '.url')
raw_url=$(echo "$response" | jq -r '.raw')

echo "URL: $url"
echo "Raw: $raw_url"

if [[ $should_copy =~ ^[Uu][Rr][Ll]$ ]]; then
  echo "$url" | wl-copy
else
  echo "$raw_url" | wl-copy
fi

echo "$should_copy copied to clipboard."
