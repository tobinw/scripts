#!/bin/bash

if [  $# != 1 ] ; then
  echo "Usage: $0 [hostname]"
  exit -1
fi

HOST=$1
SSH="ssh $HOST"
timeout 1 ping -c 1 $HOST > /dev/null
ISUP=$?
timeout 1 $SSH ls > /dev/null
ISREACHABLE=$?
if [ "$ISUP" == "0" ] && [ "$ISREACHABLE" == "0" ] ; then
  MEM=`$SSH free -m | awk 'NR==2{printf "%s/%s MB , %.2f%%", $3,$2,$3*100/$2 }'`
  CPU=`$SSH top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}'`
  TOPMEM=`$SSH ps -eo pmem,pcpu,pid,cmd,user | sort -k 1 -nr | head -1 | sed 's/ \+/ , /g'`
  TOPCPU=`$SSH ps -eo pmem,pcpu,pid,cmd,user | sort -k 2 -nr | head -1 | sed 's/ \+/ , /g'`
  echo "$HOST , $CPU , $MEM , $TOPMEM , $TOPCPU"
else
  echo "$HOST ,"
fi