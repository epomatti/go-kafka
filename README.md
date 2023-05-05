# Go Kafka demo

Start Kafka:

```
docker-compose up -d
```

Create the topic:

```
docker exec broker kafka-topics --bootstrap-server broker:9092 --create --topic quickstart
```

Start the consumer:

```
go run .
```