#!/usr/bin/env bash

function status() {
    git fetch 2>&1

    local gitstat="$(git status 2>&1)"
    git status 2>&1

    if [[ "$gitstat" == *"Your branch is ahead"* ]] || \
       [[ "$gitstat" == *"Changes not staged"* ]] || \
       [[ "$gitstat" == *"Changes to be committed"* ]] || \
       [[ "$gitstat" == *"Untracked files"* ]]; then
        echo && echo "this repo is ahead of remote" && return
    elif [[ "$gitstat" == *"Your branch is behind"* ]]; then
        echo && echo "this repo is behind remote" && return
    else
        echo && echo "this repo up to date with remote" && return
    fi
}

