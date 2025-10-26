# Cloudflare tunnel
https://github.com/nextcloud/all-in-one/tree/main#notes-on-cloudflare-proxytunnel

## Set the chunk size: see link
https://github.com/nextcloud/desktop/issues/4271#issuecomment-1159578065

# NEXTCLOUD_MOUNT
- I set it to the mount point where i can access my drives (`/mnt/disks` on Unraid). And then for borg backup i enter `/mnt/disks/[name]/backups/nextcloud` for 'local backup location'

# Unraid notes
- Do not use the FUSE user share system for stuff like backups or intensive I/O
  - NOT `/mnt/user/[share]`
  - Instead `/mnt/[poolname]/[share]` or `/mnt/disks/[diskname]`