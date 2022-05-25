#!/bin/sh
podman run --rm --pull=never -p80:80 -v${PWD}/ubuntu:/var/www/archive.ubuntu.com localhost/sinkhole:0
