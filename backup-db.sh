#!/bin/bash

# Get current timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backups/face_attendance_backup_${TIMESTAMP}.sql"

# Create backup using docker-compose exec
docker compose exec -T postgres-db pg_dump -U admin face-attendance > "${BACKUP_FILE}"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully: ${BACKUP_FILE}"
else
    echo "Database backup failed!"
    exit 1
fi 