FROM alpine:latest

## Download and install protobuf and grpc
RUN apk --update add go libc-dev tzdata protobuf
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -f /tmp/* && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /go/src/app
ENV GOPATH=/go
WORKDIR /go/src/app
VOLUME ["/go/src/app", "/go"]
ENTRYPOINT go build utari.go && ./utari

