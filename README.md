# Go Kafka - Demo

This demo runs with a statically compiled Go application using the Kafka SDK.

## Running locally

Use this segment to run your Go code locally with a sidecar docker Kafka.

Start Kafka:

```
docker-compose -f docker-compose-kafkaonly.yaml up -d
```

Create the `demo` topic:

```
docker exec broker kafka-topics --bootstrap-server broker:9092 --create --topic demo
```

Start the Go consumer:

```
go mod tidy
go run .
```

Use the CLI producer to send inline events to Kafka:

```
docker exec --interactive --tty broker kafka-console-producer --bootstrap-server broker:9092 --topic demo
```

## Running on Docker

Start up the complete environment:

```
docker-compose -f docker-compose-full.yaml build
docker-compose -f docker-compose-full.yaml up
```

Create the Kafka topic:

```
docker-compose -f docker-compose-full.yaml exec broker kafka-topics --bootstrap-server broker:9092 --create --topic demo
```

Connect to the broker and send messages for consumption:

```
docker-compose -f docker-compose-full.yaml exec --interactive --tty broker kafka-console-producer --bootstrap-server broker:9092 --topic demo
```
