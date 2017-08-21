#!/bin/sh

apk add --no-cache libstdc++
apk add --no-cache --update --virtual .build-dependencies git make g++ unzip autoconf automake libtool file openssl curl

