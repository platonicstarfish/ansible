#!/bin/bash


PACKAGES="\
podman|\
zsh|\
neovim|\
python3|\
llvm|\
libbz2-dev
build-essential|\
curl|\
git|\
llvm|\
libbz2-dev|\
libffi-dev|\
liblzma-dev|\
libncurses5-dev|\
libncursesw5-dev|\
libreadline-dev|\
libsqlite3-dev|\
libssl-dev|\
python3-openssl|\
tk-dev|\
wget|\
xz-utils|\
zlib1g-dev"

a="aptly -config=aptly.conf"

MIRRORS="jammy-main jammy-universe jammy-multiverse jammy-updates-main jammy-updates-universe jammy-updates-multiverse jammy-security-main jammy-security-universe jammy-security-multiverse"

for m in $MIRRORS;
do
  $a mirror edit -ignore-signatures -filter-with-deps -filter="$PACKAGES" $m;
  $a mirror update $m;
  $a snapshot rename $m $m-old
  $a snapshot create $m from mirror $m
done;



$a publish drop jammy
$a publish snapshot -label Ubuntu -component=main,universe,multiverse jammy-main jammy-universe jammy-multiverse

$a db cleanup

(cd public; ln -fs . ubuntu)
