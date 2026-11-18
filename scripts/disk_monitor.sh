
#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

THRESHOLD=80
LOG_FILE="$PROJECT_DIR/logs/disk_monitor.log"

mkdir -p "$PROJECT_DIR/logs"

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
