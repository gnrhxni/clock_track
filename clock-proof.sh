#!/bin/bash

a="$(mktemp -t clock-proof.sh)"
b="$(mktemp -t clock-proof.sh)"
c="$(mktemp -t clock-proof.sh)"

date_cmd="/usr/local/opt/coreutils/libexec/gnubin/date"

cat hours-log.txt | awk '{printf "@%s\t@%s\n", $1, $2;}' > "$a"
cat "$a" | awk '{print $1}' | $date_cmd -f - > "$b" 2>&1
cat "$a" | awk '{print $2}' | $date_cmd -f - > "$c" 2>&1
paste "$b" "$c" | cat -n -

rm "$a" "$b" "$c"

