
#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_FILE="$PROJECT_DIR/logs/health_check.log"

mkdir -p "$PROJECT_DIR/logs"

echo "Health Check Started: $(date)" >> "$LOG_FILE"

services=("ssh" "cron")

for service in "${services[@]}"
do
    if systemctl is-active --quiet "$service"
    then
        echo "[OK] $service is running"
        echo "[OK] $service is running" >> "$LOG_FILE"
    else
        echo "[FAIL] $service is not running"
        echo "[FAIL] $service is not running" >> "$LOG_FILE"
    fi
done

echo "Health Check Completed: $(date)" >> "$LOG_FILE"
