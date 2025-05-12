#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file.dmp>"
    exit 1
fi

f="$1"
if [[ ! -f "$f" ]]; then
    echo "Error: File '$f' not found!"
    exit 1
fi

a=$(basename "$f" .dmp)
cut -d'#' -f1 <"$f" | xxd -p -r >"$a"
chmod +x "$a"

readelf -a "$a"
echo ""
echo "HEXDUMP"
echo ""
hexdump -C "$a"
echo ""
echo "RUNNING PROGRAM"
echo ""
./"$a"
