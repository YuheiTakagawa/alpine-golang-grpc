#!/bin/sh

export protobuf_BUILD_TESTS=OFF

# Download protobuf source
cd /tmp && git clone -b $PROTOBUF_VERSION https://github.com/google/protobuf

# Compile/Install protobuf
cd /tmp/protobuf
#git submodule update --init --recursive
./autogen.sh
./configure --prefix=/usr
cd src && make -j 4
make install 

# Cleanup
cd ~
rm -rf /tmp/protobuf

