#!/usr/bin/env bash

function diff() {
    [ -z "$arg" ] && git diff && return

    arg="$1"
    shift

    if [ -n "$(echo "$arg" | grep '^[0-9]$')" ]; then
        git diff "HEAD~$arg" $@
    elif [ "$arg" == "c" ]; then
	git diff --chached $@
    else
        git diff $arg $@
    fi
}

