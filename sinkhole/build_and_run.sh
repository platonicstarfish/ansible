#!/bin/sh

docker build -q . | xargs docker run --rm -p80:80 -v ${PWD}/ubuntu:/var/www/archive.ubuntu.com
