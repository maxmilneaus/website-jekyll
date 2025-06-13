# Event-Driven Sync Implementation Guide

## 1. Update plist Configuration
Create/update `~/Library/LaunchAgents/com.maxmilne.synctojekyll.plist` with:

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
    <key>WatchPaths</key>
    <array>
        <string>/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/sync_to_jekyll.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/sync_to_jekyll_error.log</string>
</dict>
</plist>
```

## 2. Reload Service
Run these commands in Terminal:
```zsh
# Unload old service
launchctl unload ~/Library/LaunchAgents/com.maxmilne.synctojekyll.plist

# Load new service
launchctl load ~/Library/LaunchAgents/com.maxmilne.synctojekyll.plist
```

## 3. Test Real-time Sync
```zsh
# Monitor logs
tail -f /tmp/sync_to_jekyll.log

# Then make a change in Obsidian and watch for sync
```

## Key Benefits
- Triggers within 1-2 seconds of changes
- Minimal system resource usage
- More reliable than Automator
- Maintains safe update-only sync behavior