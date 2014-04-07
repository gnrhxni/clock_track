#!/bin/bash

date_cmd="/usr/local/opt/coreutils/libexec/gnubin/date"

test -d ~/hours-log.txt-archive || mkdir ~/hours-log.txt-archive
archive=~/hours-log.txt-archive/$( $date_cmd -d 'last month' '+%Y-%m.txt' )
thresh=$( $date_cmd -d "$( $date_cmd '+%Y-%m')-01" '+%s' )
awk '$1 < '$thresh' { print; }' < ~/hours-log.txt > $archive

new="$(mktemp -t clock-archive.sh)"
len=$(wc -l $archive | awk '{print $1 + 1;}')
sed -ne "${len},$ p" < ~/hours-log.txt > "${new}"
mv "${new}" ~/hours-log.txt


