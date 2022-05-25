#!/bin/sh

fetch='wget -r -nc -np -nv -x -nH -e robots=off -l 6 -R "index.html*" -R "Translation*"'

$fetch https://regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com/dists/jammy/Release
$fetch https://regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com/dists/jammy/main/binary-amd64/Packages

grep Filename dists/jammy/main/binary-amd64/Packages | awk '/Filename:/{print $2}' | xargs -I '{}' ${fetch} https://regolith-release-ubuntu-jammy-amd64.s3.amazonaws.com/\{\}

