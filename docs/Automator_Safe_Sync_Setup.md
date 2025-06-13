# Safe Additive Sync Setup with Automator

This guide implements a secure, additive synchronization system between your Obsidian vault and Jekyll site using Automator. The solution only adds/updates files and NEVER deletes anything from your Jekyll directory.

## Implementation Steps

### 1. Safe Additive Sync Script
Create `safe_sync_obsidian_to_jekyll.sh` in your project root:

```bash:~/safe_sync_obsidian_to_jekyll.sh
#!/bin/bash

# SAFE ADDITIVE SYNC SCRIPT
# Only adds/updates files - NEVER deletes anything

SOURCE="/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/"
DESTINATION="/Volumes/aWork Drive/1. Projects/Website/"

# --delete flag is intentionally omitted for safety
rsync -av \
    --exclude='.obsidian/' \
    --exclude='*.canvas' \
    --exclude='*.excalidraw' \
    --exclude='*.trash' \
    "$SOURCE" "$DESTINATION"
```

Make it executable:
```zsh
chmod +x ~/safe_sync_obsidian_to_jekyll.sh
```

### 2. Automator Workflow Setup
1. Open **Automator** (Applications → Automator)
2. Create **Folder Action**
3. Set action to receive files from:
   ```/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/```
4. Add **Run Shell Script** action with:
   ```bash
   ~/safe_sync_obsidian_to_jekyll.sh
   ```
5. Save as `Safe Sync Obsidian to Jekyll`

### 3. Testing Procedure
1. **Add test file** in Obsidian → Verify it appears in Jekyll
2. **Delete test file** in Obsidian → Verify it REMAINS in Jekyll
3. **Modify file** in Obsidian → Verify changes appear in Jekyll

## Important Notes
- Runs instantly on file changes
- 100% additive - never deletes files
- Preserves your existing Jekyll content
- Works with iCloud-synced Obsidian vaults

![Automator Workflow Example](https://example.com/automator-screenshot.png)