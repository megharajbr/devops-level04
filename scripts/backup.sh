#!/bin/bash

SOURCE="/app"
DEST="/backup"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$DEST/app_backup_$TIMESTAMP.tar.gz"

mkdir -p "$DEST"

if [ ! -d "$SOURCE" ]
then
    echo "[ERROR] Source directory does not exist"
    exit 1
fi

tar -czf "$BACKUP_FILE" "$SOURCE"

if [ $? -eq 0 ]
then
    echo "[SUCCESS] Backup created: $BACKUP_FILE"
else
    echo "[FAILED] Backup failed"
    exit 1
fi
