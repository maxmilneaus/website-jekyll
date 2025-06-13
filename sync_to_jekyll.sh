#!/bin/bash

# Bulletproof Obsidian to Jekyll Sync
# Updates only when Obsidian version is newer with lock mechanism

LOCK_FILE="/tmp/sync_to_jekyll.lock"

# Check for existing lock
if [ -e "$LOCK_FILE" ]; then
    echo "Sync skipped: Previous instance still running at $(date)" >> /tmp/sync_to_jekyll.log
    exit 0
fi

# Create lock file
touch "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"' EXIT

# Configuration
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