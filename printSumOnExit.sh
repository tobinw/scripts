#!/bin/bash

SUM=0
M_IDLE=0
function print_sum() {
  echo $(( $SUM + $M_IDLE ))
}

trap 'print_sum; exit'  SIGTERM SIGHUP SIGKILL SIGINT

while true
do
  N_IDLE=`xprintidle`
  if [ $N_IDLE -lt $M_IDLE ] ; then
   SUM=$(( $SUM + $M_IDLE ))
  fi
  M_IDLE=$N_IDLE
  sleep 1
done
