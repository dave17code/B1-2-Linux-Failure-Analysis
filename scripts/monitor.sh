#!/bin/bash

while true; do
  TIME=$(date "+%Y-%m-%d %H:%M:%S")
  PID=$(pgrep -n -f "agent-leak-app-x86")

  if [ -z "$PID" ]; then
    echo "[$TIME] PROCESS_NOT_FOUND"
  else
    ps -p "$PID" -o pid=,etime=,%cpu=,%mem=,rss=,vsz=,cmd= |
    awk -v t="$TIME" '{print "[" t "]", $0}'
  fi

  sleep 3
done
