#!/bin/bash

while read -u 3 line ; do
  . getHostData.sh "$line"
done 3< scorec_hosts