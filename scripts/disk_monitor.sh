#!/bin/bash

THRESHOLD=80
LOG_FILE="../logs/disk_monitor.log"

USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk Usage: $USAGE%"

if [ "$USAGE" -ge "$THRESHOLD" ]
then
    echo "[WARNING] Disk usage is above $THRESHOLD%"
    echo "$(date) WARNING: Disk usage is $USAGE%" >> "$LOG_FILE"
else
    echo "[OK] Disk usage is normal"
    echo "$(date) OK: Disk usage is $USAGE%" >> "$LOG_FILE"
fi