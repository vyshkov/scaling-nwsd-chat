# scaling-nwsd-chat
This project contains list of Kubernetes configurations illustrating chat horizontal scaling approach

Please find the chat projeact here: https://github.com/inna-i/nodejs-chat

Kafka list & vreate topic:
```
kafka-topics --list --zookeeper my-kafka-zookeeper:2181
kafka-topics --create --zookeeper my-kafka-zookeeper:2181 --replication-factor 1 --partitions 1 --topic test2
```

To chroot to a pod:
`k exec -it my-kafka-0 -n kafka -- /bin/bash`

To kill pod:
`kubectl delete pods <pod> --grace-period=0 --force`

To install kafka chart:
`helm install --name my-kafka --namespace kafka -f 000-helm-kafka.yaml incubator/kafka`