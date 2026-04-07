sudo cp -r /etc "/mnt/backup/etc_backup" 2>/dev/null

sudo tar -czf "/mnt/backup/var_log.tar.gz" /var/log 2>/dev/null

INTEGRITY_FILE="/mnt/backup/integrity_check.sha256"

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