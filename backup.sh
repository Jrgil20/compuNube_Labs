BACKUP_DIR="/mnt/backup"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="$BACKUP_DIR/backup_$DATE"

sudo cp -r /etc "$BACKUP_PATH/etc_backup" 2>/dev/null

sudo tar -czf "$BACKUP_PATH/var_log_$DATE.tar.gz" /var/log 2>/dev/null

INTEGRITY_FILE="$BACKUP_PATH/integrity_check_$DATE.sha256"

IMPORTANT_FILES=(
    "/etc/passwd"
    "/etc/shadow"
    "/etc/sudoers"
    "/boot/grub/grub.cfg"
)

for file in "${IMPORTANT_FILES[@]}"; do
    if [ -f "$file" ] || [ -d "$file" ]; then
        sudo sha256sum "$file" >> "$INTEGRITY_FILE" 2>/dev/null
    fi
done