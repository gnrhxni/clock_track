#!/bin/bash

awk '{s+=$2-$1; print ($2-$1)/3600}END{print "++++++++"; print s/3600;}' hours-log.txt
