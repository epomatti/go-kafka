FROM golang:1.20.4-alpine3.17 AS builder
RUN apk add --no-progress --no-cache gcc musl-dev
WORKDIR /build
COPY . .
RUN go mod download

RUN go build -tags musl -ldflags '-extldflags "-static"' -o /build/main

FROM scratch
WORKDIR /app
COPY --from=builder /build/main .
ENTRYPOINT ["/app/main"]
