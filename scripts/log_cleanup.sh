
#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

LOG_DIR="$PROJECT_DIR/logs"

mkdir -p "$LOG_DIR"

echo "Log cleanup started: $(date)"

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -print0 |
while IFS= read -r -d '' file
do
    if gzip "$file"
    then
        echo "[SUCCESS] Compressed: $file"
    else
        echo "[FAILED] Could not compress: $file"
    fi
done

echo "Log cleanup completed: $(date)"
