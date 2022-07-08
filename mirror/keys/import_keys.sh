#!/bin/bash

cat *.pub | gpg --no-default-keyring --keyring ~/.gnupg/trustedkeys.kbx --import -
