# Go Kafka demo

This demo runs with a statically compiled Go application using the Kafka SDK.

### Local consumer

Start Kafka:

```
docker-compose -f docker-compose-kafkaonly.yaml up -d
```

Create the `demo` topic:

```
docker exec broker kafka-topics --bootstrap-server broker:9092 --create --topic demo
```

Start the consumer:

```
go run .
```

Use the CLI producer to send inline events to Kafka:

```
docker exec --interactive --tty broker kafka-console-producer --bootstrap-server broker:9092 --topic demo
```

### Docker consumer

Run your Go consumer with docker:

```
docker-compose -f docker-compose-full.yaml build
docker-compose -f docker-compose-full.yaml up
```

Connect to send messages for consumption:

```
docker-compose -f docker-compose-full.yaml exec --interactive --tty broker kafka-console-producer --bootstrap-server broker:9092 --topic demo
```
