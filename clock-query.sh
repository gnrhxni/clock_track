#!/bin/bash

date_cmd="/usr/local/opt/coreutils/libexec/gnubin/date"

start=$(tail -1 ~/hours-log.txt | awk '{print $1;}')
now=$( $date_cmd '+%s' )
worktime=$(echo "(${now}- ${start})/3600" | bc -l)
echo "You've been working for $worktime hours"
