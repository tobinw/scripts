#!/bin/bash

PERIOD_S=$(( 5 ))
PERIOD_MS=$(( $PERIOD_S * 1000 ))
IDLE_TIME_MS=`timeout ${PERIOD_S}s ./printSumOnExit.sh`
WORK_TIME_MS=$(( $PERIOD_MS - $IDLE_TIME_MS ))


