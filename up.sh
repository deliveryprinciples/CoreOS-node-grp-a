#!/usr/bin/env bash

export SSH_KEY_ID="7e:0c:0f:08:04:d4:4d:c2:ec:c5:90:d4:8b:d8:f3:db"
export REGION="lon1"
export SIZE="512mb"

curl --request POST "https://api.digitalocean.com/v2/droplets" \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer "$(cat ../DOToken) \
     --data '{"region":"'"$REGION"'",
        "image":"coreos-stable",
        "size":"'"$SIZE"'",
        "private_networking":true,
        "ssh_keys":["'"$SSH_KEY_ID"'"],
        "names": ["minion-1", "minion-2", "minion-3"],
        "user_data":"'"$(cat cloud-config.yaml)"'"
      }'
