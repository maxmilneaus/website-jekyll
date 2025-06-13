# Obsidian to Jekyll Sync Setup

To set up a one-way sync from your Obsidian vault to this Jekyll project, follow these steps:

## 1. Run the Automated Setup Script

This script handles all setup tasks:

```zsh
# Make script executable
chmod +x setup_obsidian_sync.sh

# Run the setup script
./setup_obsidian_sync.sh
```

The script will:
1. Create backups of existing directories
2. Set up symbolic links for notes, pages, and projects
3. Update .gitignore to exclude Obsidian-specific files

## 2. Set Up Asset Synchronization (Optional)

For automatic asset synchronization:

1. **Create the sync script** (`obsidian_sync.sh`):
```zsh
#!/bin/zsh

# Obsidian to Jekyll Sync Script (Assets only)
# This script synchronizes asset changes from Obsidian vault to Jekyll project

OBSIDIAN_ASSETS="/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/assets/"
JEKYLL_ASSETS="/Volumes/aWork Drive/1. Projects/Website/assets/"

echo "Syncing assets from Obsidian to Jekyll at $(date)" >> /tmp/obsidian_sync.log
rsync -av \
    --exclude='.obsidian/' \
    "$OBSIDIAN_ASSETS" \
    "$JEKYLL_ASSETS" >> /tmp/obsidian_sync.log 2>> /tmp/obsidian_sync_error.log
echo "Asset sync completed." >> /tmp/obsidian_sync.log
```

2. **Make it executable**:
```zsh
chmod +x obsidian_sync.sh
```

3. **Create a launchd service** (`com.maxmilne.obsidian-sync.plist`) in `~/Library/LaunchAgents/`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.maxmilne.obsidian-sync</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Volumes/aWork Drive/1. Projects/Website/obsidian_sync.sh</string>
    </array>
    <key>WatchPaths</key>
    <array>
        <string>/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/obsidian_sync.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/obsidian_sync_error.log</string>
</dict>
</plist>
```

4. **Load the service**:
```zsh
launchctl load -w ~/Library/LaunchAgents/com.maxmilne.obsidian-sync.plist
```

## Real-Time Updates

- **Notes/Pages/Projects**: Changes appear instantly via symbolic links
- **Assets**: Changes sync automatically through the background service
- **Logs**: Check sync status at any time:
```zsh
cat /tmp/obsidian_sync.log
cat /tmp/obsidian_sync_error.log
```

## Important Notes
- The sync is one-way: Obsidian → Jekyll
- Your Obsidian vault remains private
- Changes made directly in Jekyll will be overwritten