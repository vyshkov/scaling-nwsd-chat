#!/usr/bin/env bash

parentdir="$(dirname "$dir")"

echo "00. Setup Kafka \n"
microk8s helm install --name my-kafka --namespace kafka -f $parentdir/000-helm-kafka.yaml incubator/kafka

echo "01. Setup Role-based access control (RBAC) for Traefik \n"
microk8s kubectl apply -f $parentdir/001-rbac.yaml

echo "02. Setup Traefik deployment and the service \n"
microk8s kubectl apply -f $parentdir/002-traefik-svc-dep.yaml

echo "03. Setup Chat"
microk8s kubectl apply -f $parentdir/003-chat-dep.yaml  

echo "04. Setup Traefik <-> Chat ingress route \n"
microk8s kubectl apply -f $parentdir/004-chat-ingress-route.yaml