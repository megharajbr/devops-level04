
#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

SOURCE="/app"
DEST="$PROJECT_DIR/backup"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$DEST/app_backup_$TIMESTAMP.tar.gz"

mkdir -p "$DEST"

if [ ! -d "$SOURCE" ]
then
    echo "[ERROR] Source directory does not exist: $SOURCE"
    exit 1
fi

if tar -czf "$BACKUP_FILE" "$SOURCE"
then
    echo "[SUCCESS] Backup created: $BACKUP_FILE"
else
    echo "[FAILED] Backup failed"
    exit 1
fi
