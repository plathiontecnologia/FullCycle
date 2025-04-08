FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o main .

FROM scratch
WORKDIR /root/
COPY --from=builder /app/main .
CMD ["./main"]