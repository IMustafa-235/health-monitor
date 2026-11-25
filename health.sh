#!/bin/bash
echo "Health Report"
date
DISK=$(df -h / | tail -n 1 | awk '{print $5}')
echo "Disk use: $DISK"
MEM=$(free -h | grep Mem | awk '{print $3}')
echo "Memory use: $MEM"
WEB=$(curl -s -o /dev/null -w "%{http_code}" https://www.google.com)
echo "Website status: $WEB"
if [ "$WEB" = "200" ]; then
  echo "Website: OK"
else
  echo "Website: ALERT"
  exit 1
fi
echo "check complete"
# PR test
