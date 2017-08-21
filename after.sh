#!/bin/sh

# Cleanup
apk del --no-cache --purge .build-dependencies
rm -rf /var/cache/apk/*
rm /tmp/*.sh

