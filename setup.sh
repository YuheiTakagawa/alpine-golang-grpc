#!/bin/sh

export protobuf_BUILD_TESTS=OFF
apk add --no-cache libstdc++
#apk add --no-cache --update --virtual .build-dependencies git alpine-sdk autoconf automake libtool file openssl

apk add --no-cache --update --virtual .build-dependencies git make g++ unzip autoconf automake libtool file openssl curl


# Download protobuf source
cd /tmp && git clone https://github.com/google/protobuf

# Compile/Install protobuf
cd /tmp/protobuf
./autogen.sh
./configure --prefix=/usr
cd src && make -j 4
make install 

# Cleanup
rm -rf /tmp/protobuf

apk del --no-cache --purge .build-dependencies
rm -rf /var/cache/apk/*
rm /tmp/setup.sh
