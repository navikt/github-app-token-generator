#!/bin/sh -l
export PRIVATE_KEY=$1
export APP_ID=$2

jwt=$(ruby generate-jwt.rb)
installation_id=$(curl -s \
-H "Authorization: Bearer ${jwt}" \
-H "Accept: application/vnd.github.machine-man-preview+json" \
https://api.github.com/repos/${GITHUB_REPOSITORY}/installation | jq -r .id)

echo ::set-output name=token::$(curl -s -X POST \
-H "Authorization: Bearer ${jwt}" \
-H "Accept: application/vnd.github.machine-man-preview+json" \
https://api.github.com/app/installations/${installation_id}/access_tokens | jq -r .token)