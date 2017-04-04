FROM alpine:3.5

ENV PROTOBUF_VERSION=3.2.0
ENV PROTOC_DOC_GEN_VERSION=0.8

## Download and install protobuf
ADD setup.sh /tmp/setup.sh
RUN set -ex \
    && /tmp/setup.sh \
    && protoc --version 
