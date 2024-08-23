#!/bin/sh -ef

# ide.kaitai.io/devel needs to be rebuilt after we publish the latest JS build of KSC to npm.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ksc_version>"
    exit 1
fi

ksc_version=$1

PROJECT='kaitai-io/kaitai_struct_webide'

echo "Triggering build for $PROJECT project..."
if [ -n "$KAITAI_STRUCT_WEBIDE_GITHUB_TOKEN" ]; then
	# `event_type` must match the name whitelisted in the CI workflow config in
	# https://github.com/kaitai-io/kaitai_struct_webide
	body=$(jq -n -c --arg ksc_version "$ksc_version" '{event_type: "rebuild", client_payload: {ksc_version: $ksc_version}}')

	printf '%s\n' "$body"

	curl -fsSL \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $KAITAI_STRUCT_WEBIDE_GITHUB_TOKEN" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		-d "$body" \
		"https://api.github.com/repos/$PROJECT/dispatches"
else
	echo "No KAITAI_STRUCT_WEBIDE_GITHUB_TOKEN found!"
	exit 1
fi
