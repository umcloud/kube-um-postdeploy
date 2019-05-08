#!/bin/bash

# Huristic: find "recent" users, navarrow is SPECIAL
USERS=$(./pygithub-ex.sh)

for gh_user in ${USERS};do
  user=${gh_user,,}
  echo "kubectl create ns ${user:?} --dry-run -oyaml|kubectl apply -f-"
  echo "kubectl create rolebinding --namespace=${user} --user=${gh_user} --clusterrole=edit ${user}-role-ns-edit --dry-run -oyaml|kubectl apply -f-"
done

GH_TEAM=students-cd-19
echo "kubectl create clusterrolebinding --group=${GH_TEAM:?} --clusterrole=view students-clusterrole-view --dry-run -oyaml|kubectl apply -f-"
