#!/bin/bash

# Huristic: find "recent" users, navarrow is SPECIAL
USERS=$(./pygithub-ex.sh)

for user in ${USERS};do
  user=${user,,}
  echo kubectl create ns ${user:?}
  echo kubectl create rolebinding --namespace=${user} --user=${user} --clusterrole=edit ${user}-role-ns-edit
done

GH_TEAM=students-cd-18
echo kubectl create clusterrolebinding --group=${GH_TEAM:?} --clusterrole=view students-clusterrole-view
