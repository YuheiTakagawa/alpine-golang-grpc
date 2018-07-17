FROM alpine:latest

ENV PROTOBUF_VERSION=master
ENV GRPC_VERSION=v1.4.x
ENV PROTOC_DOC_GEN_VERSION=0.8

## Download and install protobuf and grpc
ADD before.sh           /tmp/before.sh
ADD install_protobuf.sh /tmp/install_protobuf.sh
ADD install_grpc.sh     /tmp/install_grpc.sh
ADD after.sh            /tmp/after.sh
RUN set -ex \
    && /tmp/before.sh		\
    && /tmp/install_protobuf.sh	\
    && /tmp/install_grpc.sh		\
    && /tmp/after.sh		\
    && protoc --version		\
    && which grpc_cpp_plugin
RUN apk --update add go git libc-dev tzdata
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /go/src/app
ENV GOPATH=/go
WORKDIR /go/src/app
VOLUME ["/go/src/app", "/go"]
ENTRYPOINT go build utari.go && ./utari

