#!/bin/bash
export TOKEN=$(set -x; kubectl config view -ojson |jq -r '.users[]|select (.name|match("um-"))|.user.token')
: ${TOKEN:?}
# echo "TOKEN=${TOKEN}"
GH_ORG=umcloud-external
GH_TEAM=students-cd-19
set -u
./pygithub-ex.py ${TOKEN} ${GH_ORG} ${GH_TEAM}

