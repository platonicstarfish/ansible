#!/bin/bash

# Get ansible and podman such that we can install them using dpkg -i
# to bootstrap an airgapped system for ansible deployment.

apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests \
	--no-conflicts --no-breaks --no-replaces --no-enhances \
	--no-pre-depends \
	ansible podman \
	| grep "^\w" | sort)

