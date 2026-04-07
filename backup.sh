sudo cp -r /etc "/mnt/backup/etc_backup" 2>/dev/null

sudo tar -czf "/mnt/backup/var_log.tar.gz" /var/log 2>/dev/null

for file in "/etc/passwd" "/etc/shadow" "/etc/sudoers" "/boot/grub/grub.cfg"; do
    if [ -f "$file" ] || [ -d "$file" ]; then
        sudo sha256sum "$file" >> "/mnt/backup/integrity_check.sha256" 2>/dev/null
    fi
done