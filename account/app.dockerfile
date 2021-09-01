# docker-composeから起動するよう これどうにかならんかな
# FROM golang:1.10.2 AS build
FROM golang:1.15.2-alpine
RUN apk update && apk add git
WORKDIR /go/src/app
COPY go.mod go.sum ./
COPY account ./
# go.modという公式パッケージ管理ツールを使っているので、go runやgo build実行時に不足パッケージが自動的にダウンロードされるはず。
# あえてvendorを生成する必要がある場合はgo mod vendorを実行する
# COPY vendor vendor

RUN go build -o /go/bin/main ./cmd/account/main.go
WORKDIR /go/bin
EXPOSE 8080

CMD ["main"]
