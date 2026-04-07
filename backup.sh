sudo cp -r /etc "/mnt/backup/etc_backup" 2>/dev/null

sudo tar -czf "/mnt/backup/var_log.tar.gz" /var/log 2>/dev/null

if [ -f "/etc/passwd" ] || [ -d "/etc/passwd" ]; then
    sudo sha256sum "/etc/passwd" >> "/mnt/backup/integrity_check.sha256" 2>/dev/null
fi

if [ -f "/etc/shadow" ] || [ -d "/etc/shadow" ]; then
    sudo sha256sum "/etc/shadow" >> "/mnt/backup/integrity_check.sha256" 2>/dev/null
fi

if [ -f "/etc/sudoers" ] || [ -d "/etc/sudoers" ]; then
    sudo sha256sum "/etc/sudoers" >> "/mnt/backup/integrity_check.sha256" 2>/dev/null
fi

if [ -f "/boot/grub/grub.cfg" ] || [ -d "/boot/grub/grub.cfg" ]; then
    sudo sha256sum "/boot/grub/grub.cfg" >> "/mnt/backup/integrity_check.sha256" 2>/dev/null
fi