#!/bin/zsh

# Watch both directories and sync when files change
echo "Starting Unison file watcher..."

fswatch -o \
  "/Users/maxmilne/Library/Mobile Documents/iCloud~md~obsidian/Documents/aVault/Website" \
  "/Volumes/aWork Drive/1. Projects/Vibe Coding/1 . Active/Website" \
  --exclude="\.unison" \
  --exclude="\.DS_Store" \
  --exclude="\.git" \
  --exclude="_site" \
  --exclude="sync-system" \
  --latency=2 | \
while read num; do
  echo "$(date): Files changed, syncing..."
  unison obsidian -ui text -batch
done