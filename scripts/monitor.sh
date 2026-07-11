#!/bin/bash
while true; do
  TIME=$(date "+%Y-%m-%d %H:%M:%S")
  PID=$(pgrep -n -f "agent-leak-app")
  if [ -z "$PID" ]; then
    echo "[$TIME] PROCESS_NOT_FOUND"
  else
    TOP_LINE=$(top -b -n 1 | grep -E "^[ ]*${PID}\b" | head -n 1)
    if [ -n "$TOP_LINE" ]; then
      # 템플릿 요구 컬럼 순서 매핑: [TIME] PID CPU MEM RES
      echo "$TOP_LINE" | awk -v t="$TIME" '{print "["t"]", "PID:"$1, "CPU:"$9"%", "MEM:"$10"%", "RES:"$6}'
    fi
  fi
  sleep 0.5
done
