#!/bin/bash

# Obsidian to Jekyll Sync Script
# One-way synchronization with periodic updates

SOURCE="/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website/"
DESTINATION="/Volumes/aWork Drive/1. Projects/Website/"

echo "Starting sync from Obsidian to Jekyll at $(date)" >> /tmp/sync_to_jekyll.log
rsync -av --delete \
    --exclude='.obsidian/' \
    --exclude='*.canvas' \
    --exclude='*.excalidraw' \
    --exclude='*.trash' \
    "$SOURCE" "$DESTINATION" >> /tmp/sync_to_jekyll.log 2>> /tmp/sync_to_jekyll_error.log
echo "Sync completed at $(date)" >> /tmp/sync_to_jekyll.log