
#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

SOURCE="$PROJECT_DIR/scripts"
DEST="$PROJECT_DIR/backup"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$DEST/scripts_backup_$TIMESTAMP.tar.gz"

mkdir -p "$DEST"

if [ ! -d "$SOURCE" ]
then
    echo "[ERROR] Source directory does not exist"
    exit 1
fi

if tar -czf "$BACKUP_FILE" -C "$PROJECT_DIR" scripts
then
    echo "[SUCCESS] Backup created: $BACKUP_FILE"
else
    echo "[FAILED] Backup failed"
    exit 1
fi
