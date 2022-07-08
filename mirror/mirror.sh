#!/bin/bash

(cd keys/; ./import_keys.sh)

for dist in jammy jammy-updates
do
	debmirror -v -p -d $dist -a amd64 --nosource --method=ftp --passive -h dk.archive.ubuntu.com $dist/ \
		--exclude='/Translation-.*' --include='/Translation-(en)\..*' \
		--exclude='/language-pack-.*' --include='/language-pack-?(gnome|kde)-(en).*' \
		--exclude='(thunderbird|firefox)-locale-.*' \
		--exclude='/libreoffice-l10n.*' \
		--exclude='/manpages-(\w{2}|\w{2}-extra|\w{2}-dev|\w{2}-extra-dev)_.*' \
		--exclude='/myspell-(\w{2}|\w{2}-\w{2,3}|)[-_].*' \
		--exclude='/aspell-(\w{2}|\w{2}-\w{2,3}|)[-_].*' \
		--exclude='/debian-reference-(\w{2}|\w{2}-\w{2,3}|)[-_].*' \
		--exclude='/dict-freedict-.*' \
		--exclude='/games-.*' \
		--exclude='/gnome-user-docs-.*' \
		--exclude='/libghc-.*' \
		--exclude='/libjs-.*' \
		--exclude='/libkf5-.*' \
		--exclude='/librust-.*' \
		--exclude='/node-.*' \
		--exclude='/php-.*' \
		--exclude='/r-cran-.*' \
		--exclude='/ruby-.*' \
		--exclude='/tryton-.*' \
		--exclude='/gcc-9.*' \
		--exclude='/gcc-10.*' \
		--exclude='/gcc-11.*' \
		--exclude='/mysql.*' \
		--exclude='/texlive.*' \
		--exclude='/.*azure.*' \
		--exclude='/.*gcp.*' \
		--exclude='/.*aws.*' \
		--exclude='/.*oracle.*' \
		--exclude-deb-section=games \
		--exclude-deb-section=news \
		--exclude-deb-section=xfce \
		--exclude-deb-section=mail \
		--exclude-deb-section=haskell \
		--exclude-deb-section=gnustep \
		--exclude-deb-section=localization \
		--exclude-deb-section=gnu-r \
		--exclude-deb-section=doc \
		--exclude-deb-section=javascript \
		--exclude-deb-section=rust \
		--exclude-deb-section=php \
		--exclude-deb-section=ocaml \
		--exclude-deb-section=contrib/ocaml \
		--exclude-deb-section=kde \
		--exclude-deb-section=ruby;
done

## Regolith
debmirror -v -p -d jammy -a amd64 --nosource --rsync-extra=none --method=https -h regolith-desktop.io -r release-ubuntu-jammy-amd64 regolith-jammy/

## VSCode
# Get newest version of vscode, such that we only mirror that
CODE_VERSION="$(curl -s https://packages.microsoft.com/repos/code/dists/stable/main/binary-amd64/Packages | grep -E "Package: code$" -A 10 | grep "Version" | awk '{print $2}' | sort -h | uniq | tail -n1)"

debmirror -v -p -d stable -a amd64 --nosource --rsync-extra=none --method=http -h packages.microsoft.com -r repos/code vscode-stable/ \
	--exclude-field='Version=.*' --include-field="Version=$CODE_VERSION"

## Gnuradio
debmirror -v -p -d jammy -a amd64 --nosource --rsync-extra=none --method=https -h ppa.launchpadcontent.net -r gnuradio/gnuradio-releases/ubuntu gnuradio-jammy/

## UHD
debmirror -v -p -d jammy -a amd64 --nosource --rsync-extra=none --method=https -h ppa.launchpadcontent.net -r ettusresearch/uhd/ubuntu uhd-jammy/

## Wireshark-dev
debmirror -v -p -d jammy -a amd64 --nosource --rsync-extra=none --method=https -h ppa.launchpadcontent.net -r wireshark-dev/stable/ubuntu wireshark-dev-jammy/

## bcompare4
debmirror -v -p -d bcompare4 -s non-free -a amd64 --nosource --rsync-extra=none --method=https -h www.scootersoftware.com -r '' bcompare4/


## Vagrant
# Below is not working because debmirror inserts a double slash when specifying an empty -r parameter
#debmirror -v -p -d jammy -a amd64 --nosource --rsync-extra=none --method=https -h apt.releases.hashicorp.com -r '' hashicorp-jammy/

