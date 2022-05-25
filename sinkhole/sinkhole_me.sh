#!/bin/sh
podman run --rm --pull=never -p80:80 \
	-v${PWD}/ubuntu:/var/www/archive.ubuntu.com \
	-v${PWD}/regolith:/var/www/regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com \
	localhost/sinkhole:0

