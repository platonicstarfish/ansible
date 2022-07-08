#!/bin/bash

xorriso -dev /dev/sr0 -rockridge on -disk_dev_ino on -update_r ~/git/ansible/mirror/ / -rm_r '/*/*.temp*' --

