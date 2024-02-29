#!/usr/bin/env bash

function sync() {
    stat="$(status | tail -n 1)"

    case "$stat" in
        *"behind"*) echo "repo is behind, pulling" && git pull ;;
        *"ahead"*) echo "repo is ahead, pushing" && diff && read -r && git add . && git commit && git push ;;
        *"up to date"*) echo "repo is up to date, nothing left to do" ;;
    esac
}
