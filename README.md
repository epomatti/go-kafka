# Go Kafka demo

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



```
docker-compose -f docker-compose-full.yaml up
```
