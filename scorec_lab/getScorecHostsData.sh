#!/bin/bash
# print a synopsis for all hostnames in the scorec_hosts file
while read -u 3 line ; do
  . getHostData.sh "$line"
done 3< scorec_hosts
