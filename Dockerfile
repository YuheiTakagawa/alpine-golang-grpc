FROM alpine:3.6

ENV PROTOBUF_VERSION=3.2.0
ENV GRPC_VERSION=v1.4.x
ENV PROTOC_DOC_GEN_VERSION=0.8

## Download and install protobuf and grpc
ADD before.sh           /tmp/before.sh
ADD install_protobuf.sh /tmp/install_protobuf.sh
ADD install_grpc.sh     /tmp/install_grpc.sh
ADD after.sh            /tmp/after.sh
RUN set -ex \
    && /tmp/before.sh           \
    && /tmp/install_protobuf.sh \
    && /tmp/install_grpc.sh     \
    && /tmp/after.sh            \
    && protoc --version         \
    && which grpc_cpp_plugin

