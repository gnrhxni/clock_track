#!/bin/bash

date_cmd="/usr/local/opt/coreutils/libexec/gnubin/date"

date=$@
test -z "${date}" && date="now"

printf '%s ' $($date_cmd -d "${date}" '+%s') >> ~/hours-log.txt
