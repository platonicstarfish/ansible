#!/bin/bash

a="aptly -config=aptly.conf"

$a mirror create -ignore-signatures jammy-main http://dk.archive.ubuntu.com/ubuntu/ jammy main restricted
$a mirror create -ignore-signatures jammy-universe http://dk.archive.ubuntu.com/ubuntu/ jammy universe
$a mirror create -ignore-signatures jammy-multiverse http://dk.archive.ubuntu.com/ubuntu/ jammy multiverse

$a mirror create -ignore-signatures jammy-updates-main http://dk.archive.ubuntu.com/ubuntu/ jammy-updates main restricted
$a mirror create -ignore-signatures jammy-updates-universe http://dk.archive.ubuntu.com/ubuntu/ jammy-updates universe
$a mirror create -ignore-signatures jammy-updates-multiverse http://dk.archive.ubuntu.com/ubuntu/ jammy-updates multiverse

$a mirror create -ignore-signatures jammy-security-main http://security.ubuntu.com/ubuntu/ jammy-security main restricted
$a mirror create -ignore-signatures jammy-security-universe http://security.ubuntu.com/ubuntu/ jammy-security universe
$a mirror create -ignore-signatures jammy-security-multiverse http://security.ubuntu.com/ubuntu/ jammy-security multiverse



