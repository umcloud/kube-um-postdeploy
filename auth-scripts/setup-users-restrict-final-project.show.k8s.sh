#!/bin/bash
# Restrict view-all to only specific namespaces
GH_TEAM=students-cd-18
echo "kubectl delete clusterrolebinding students-clusterrole-view"
echo "kubectl create clusterrolebinding --group=${GH_TEAM:?} students-clusterrolebinding-view-restricted --clusterrole=students-cluster-view-restricted --dry-run -oyaml|kubectl apply -f-"
for ns in kube-system kube-public ingress-nginx um default ceph openebs monitoring logging; do
    echo "kubectl create rolebinding -n $ns --group=${GH_TEAM:?} --clusterrole=view students-role-view --dry-run -oyaml|kubectl apply -f-"
done
