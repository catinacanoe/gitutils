#!/usr/bin/env bash

function sync() {
    stat="$(status | tail -n 1)"

    case "$stat" in
        *"behind"*) echo "crypt is behind, pulling" && git pull ;;
        *"ahead"*) echo "crypt is ahead, pushing" && diff && read -r && git add . && git commit && git push ;;
        *"up to date"*) echo "crypt is up to date, nothing left to do" ;;
    esac
}
