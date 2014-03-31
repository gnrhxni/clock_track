
#!/bin/bash

date_cmd="/usr/local/opt/coreutils/libexec/gnubin/date"

date=$@
test -z "${date}" && date="now"

echo $($date_cmd -d "${date}" '+%s') >> ~/hours-log.txt
