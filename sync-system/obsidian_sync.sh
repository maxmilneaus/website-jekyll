#!/bin/zsh

# Obsidian to Jekyll Sync Script (Assets only)
# This script synchronizes asset changes from Obsidian vault to Jekyll project

SOURCE="/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/"
DESTINATION="/Volumes/aWork Drive/1. Projects/Vibe Coding/1 . Active/Website/"

echo "Syncing entire directory from Obsidian to Jekyll at $(date)" >> /tmp/obsidian_sync.log
rsync -av \
    --exclude='.obsidian/' \
    --exclude='*.canvas' \
    --exclude='*.excalidraw' \
    --exclude='*.trash' \
    --exclude='sync-system/' \
    "$SOURCE" "$DESTINATION" >> /tmp/obsidian_sync.log 2>> /tmp/obsidian_sync_error.log
echo "Directory sync completed." >> /tmp/obsidian_sync.log