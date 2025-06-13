# Obsidian to Jekyll Sync Setup (Robust Method)

This guide implements a reliable one-way sync using `rsync` and `launchd` to keep your Jekyll site updated with changes from your Obsidian vault, while maintaining vault privacy.

## Why This Approach?
- Avoids potential issues with symbolic links and iCloud
- Works reliably with Obsidian and Jekyll
- Provides near real-time updates (every 2 minutes)
- Preserves your vault's privacy

## Setup Instructions

### 1. Create the Synchronization Script

1. **Create `sync_to_jekyll.sh`** in your Jekyll project root:
```bash
#!/bin/bash
SOURCE="/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/"
DESTINATION="/Volumes/aWork Drive/1. Projects/Website/"
rsync -av --delete \
    --exclude='.obsidian/' \
    --exclude='*.canvas' \
    --exclude='*.excalidraw' \
    --exclude='*.trash' \
    "$SOURCE" "$DESTINATION"
```

2. **Make it executable**:
```zsh
chmod +x sync_to_jekyll.sh
```

### 2. Create the Launchd Service

1. **Create `com.maxmilne.synctojekyll.plist`** in `~/Library/LaunchAgents/`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.maxmilne.synctojekyll</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Volumes/aWork Drive/1. Projects/Website/sync_to_jekyll.sh</string>
    </array>
    <key>StartInterval</key>
    <integer>120</integer>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/sync_to_jekyll.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/sync_to_jekyll_error.log</string>
</dict>
</plist>
```

### 3. Load and Start the Service

```zsh
launchctl load ~/Library/LaunchAgents/com.maxmilne.synctojekyll.plist
launchctl start com.maxmilne.synctojekyll
```

### 4. Initial Synchronization

Run the setup script to perform the first sync and configure .gitignore:
```zsh
chmod +x setup_obsidian_sync.sh
./setup_obsidian_sync.sh
```

## Verification
Check synchronization status:
```zsh
cat /tmp/sync_to_jekyll.log
cat /tmp/sync_to_jekyll_error.log
```

## Maintenance
- **Stop sync**: `launchctl unload ~/Library/LaunchAgents/com.maxmilne.synctojekyll.plist`
- **Adjust frequency**: Edit `StartInterval` value (seconds) in the plist
- **View logs**: Check `/tmp/sync_to_jekyll*.log` files

## Important Notes
- Sync occurs automatically every 2 minutes
- All changes flow one-way: Obsidian → Jekyll
- Your Obsidian vault remains completely private
- Never edit files directly in Jekyll - changes will be overwritten