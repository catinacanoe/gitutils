#!/usr/bin/env bash

for script in "$(dirname "$0")/fn/"*; do
    source "$script"
done

command="$1"
shift

[ "$command" != "clone" ] && [ "$command" != "init" ] && check

"$command" $@
