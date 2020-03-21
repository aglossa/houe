#!/bin/bash
# File brought by github.com/aglossa/houe

if ! [[ -x ~/update-golang/update-golang.sh ]]; then
    cd ~
    git clone https://github.com/udhos/update-golang
    echo "run with sudo ~./update-golang/update-golang.sh
fi