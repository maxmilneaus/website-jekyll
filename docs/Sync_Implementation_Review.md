# Obsidian-Jekyll Sync Implementation Report

## System Overview
- **Sync Method**: Event-driven with WatchPaths + Lock Mechanism
- **Sync Direction**: Obsidian → Jekyll (one-way)
- **Update Behavior**: Only when Obsidian version is newer
- **Log Location**: `/tmp/sync_to_jekyll.log`
- **Error Log**: `/tmp/sync_to_jekyll_error.log`

## Key Components
### 1. Sync Script (`sync_to_jekyll.sh`)
```bash
#!/bin/bash
LOCK_FILE="/tmp/sync_to_jekyll.lock"

if [ -e "$LOCK_FILE" ]; then
    echo "Sync skipped: Previous instance still running at $(date)" >> /tmp/sync_to_jekyll.log
    exit 0
fi

touch "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"' EXIT

SOURCE="/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/"
DESTINATION="/Volumes/aWork Drive/1. Projects/Website/"

echo "Starting smart sync at $(date)" >> /tmp/sync_to_jekyll.log
rsync -avu \
    --exclude='.obsidian/' \
    --exclude='*.canvas' \
    --exclude='*.excalidraw' \
    --exclude='*.trash' \
    "$SOURCE" "$DESTINATION" >> /tmp/sync_to_jekyll.log 2>> /tmp/sync_to_jekyll_error.log
echo "Sync completed at $(date)" >> /tmp/sync_to_jekyll.log
```

### 2. Launchd Service (`com.maxmilne.synctojekyll.plist`)
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

## Current Status
- **Script Functionality**: Verified working through manual execution
- **Service Status**: Launchd shows I/O errors during reload
- **Last Sync**: Fri Jun 13 21:54:52 AEST 2025 (successful)
- **Files Synced**: 2595925 bytes transferred
- **Lock Mechanism**: Prevents overlapping sync operations

## Areas for Improvement
1. **Launchd Troubleshooting**:
   - Resolve "Input/output error" during service reload
   - Investigate alternative service managers

2. **Performance Optimization**:
   - Add rsync progress reporting
   - Implement incremental sync for large files

3. **Error Handling**:
   - Add email/SMS notifications for failures
   - Implement retry mechanism for transient errors

4. **Monitoring**:
   - Add health check endpoint
   - Implement log rotation

5. **Security**:
   - Encrypt sensitive paths in configuration
   - Add checksum verification