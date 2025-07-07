# Obsidian to Jekyll Sync System

This directory contains the final, working sync system for synchronizing content from Obsidian vault to Jekyll website.

## Files

### Scripts
- **`obsidian_sync.sh`** - Main sync script for assets only. Monitors Obsidian vault and syncs asset changes to Jekyll project.
- **`setup_obsidian_sync.sh`** - Initial setup script that performs full synchronization and configures .gitignore.

### Configuration
- **`com.maxmilne.obsidian-sync.plist`** - LaunchAgent configuration for automated syncing using file watching.

## Installation

1. Run the setup script once:
   ```bash
   chmod +x setup_obsidian_sync.sh
   ./setup_obsidian_sync.sh
   ```

2. Install the LaunchAgent:
   ```bash
   cp com.maxmilne.obsidian-sync.plist ~/Library/LaunchAgents/
   launchctl load ~/Library/LaunchAgents/com.maxmilne.obsidian-sync.plist
   ```

## How It Works

- The system watches the Obsidian vault at: `/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/`
- When changes are detected, it syncs assets to: `/Volumes/aWork Drive/1. Projects/Website/assets/`
- Logs are written to `/tmp/obsidian_sync.log` and `/tmp/obsidian_sync_error.log`

## Exclusions

The sync excludes:
- `.obsidian/` directories
- `*.canvas` files
- `*.excalidraw` files  
- `*.trash` files

## Note

This directory is excluded from Jekyll site generation via .gitignore to prevent sync scripts from appearing on the website.