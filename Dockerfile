FROM golang:1.20.4-alpine3.17 AS builder
RUN apk add --no-progress --no-cache gcc musl-dev
WORKDIR /app
COPY . .
RUN go mod download

RUN go build -tags musl -installsuffix cgo -ldflags '-extldflags "-static"' -o /app/bin/main

FROM scratch
WORKDIR /app
COPY --from=builder /app/bin/main /app/bin/main
ENTRYPOINT ["/app/bin/main"]