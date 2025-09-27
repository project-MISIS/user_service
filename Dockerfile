FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY ./ ./

RUN go build ./main.go

FROM gcr.io/distroless/static-debian12 AS release-stage
WORKDIR /
COPY --from=builder /app/user_service ./user_service
USER nonroot:nonroot  
ENTRYPOINT ["/user_service"]

