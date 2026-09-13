#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Error: writefile and writestr must both be specified." >&2
    exit 1
fi

writefile=$1
writestr=$2
writedir=$(dirname -- "$writefile")

if ! mkdir -p -- "$writedir"; then
    echo "Error: could not create directory: $writedir" >&2
    exit 1
fi

if ! printf '%s\n' "$writestr" > "$writefile"; then
    echo "Error: could not create file: $writefile" >&2
    exit 1
fi
