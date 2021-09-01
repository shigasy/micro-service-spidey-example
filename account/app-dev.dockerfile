# FROM golang:1.10.2 AS build
FROM golang:1.15.2-alpine
RUN apk update && apk add git
WORKDIR /go/src/app
COPY . /go/src/app

RUN go build -o /go/bin/main ./cmd/account/main.go
WORKDIR /go/bin
EXPOSE 8080
CMD ["main"]
