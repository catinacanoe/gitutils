#!/usr/bin/env bash

check() {
    while true; do
	[ "$PWD" == "/" ] && break
	[ -d .git/ ] && return
	cd ..
    done

    echo "not a git repository, exiting ..."
    exit 1
}

