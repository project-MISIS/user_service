FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY ./ ./

RUN go mod download

RUN go build ./main.go

FROM gcr.io/distroless/static-debian12 AS release-stage
WORKDIR /
COPY --from=builder /app/user_service ./user_service
USER nonroot:nonroot  
ENTRYPOINT ["/user_service"]

