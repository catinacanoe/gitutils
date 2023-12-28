#!/usr/bin/env bash

function clone() {
    [ -z "$1" ] && echo "please pass remote adress" && return || remote="$1"
    name="$2"

    [ -f "$name" ] && echo "target is already a file" && return
    [ -d "$name" ] && [ -n "$(ls -A "$name")" ] && echo "target is already a populated directory" && return
    
    git clone "$remote" "$name"
}
