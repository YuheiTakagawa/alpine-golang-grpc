#!/bin/sh

# Download grpc source
cd /tmp &&  git clone -b $GRPC_VERSION https://github.com/grpc/grpc
cd grpc 
git submodule update --init
make
make install

# I should do, but I want to know correct solution
ln -s /usr/local/lib/libgrpc++.so /usr/local/lib/libgrpc++.so.1

# Cleanup
cd ~
rm -rf /tmp/grpc

