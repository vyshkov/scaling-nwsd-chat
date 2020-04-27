#!/usr/bin/env bash

parentdir="$(dirname "$dir")"

echo "00. Delete Kafka \n"
microk8s helm delete my-kafka --purge

echo "01. Setup Role-based access control (RBAC) for Traefik \n"
microk8s kubectl delete -f $parentdir/001-rbac.yaml

echo "02. Setup Traefik deployment and the service \n"
microk8s kubectl delete -f $parentdir/002-traefik-svc-dep.yaml

echo "03. Setup Chat"
microk8s kubectl delete -f $parentdir/003-chat-dep.yaml  

echo "04. Setup Traefik <-> Chat ingress route \n"
microk8s kubectl delete -f $parentdir/004-chat-ingress-route.yaml

echo "05. Current state: \n"
microk8s kubectl get all --all-namespaces