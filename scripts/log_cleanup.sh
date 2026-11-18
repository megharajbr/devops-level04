#!/bin/bash

LOG_DIR="/logs"
BACKUP_DIR="/backup"

mkdir -p "$BACKUP_DIR"

echo "Log cleanup started: $(date)"

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -print0 |
while IFS= read -r -d '' file
do
    gzip "$file"

    if [ $? -eq 0 ]
    then
        echo "[SUCCESS] Compressed: $file"
    else
        echo "[FAILED] Could not compress: $file"
    fi
done

echo "Log cleanup completed: $(date)"
