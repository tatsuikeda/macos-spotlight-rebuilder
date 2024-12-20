#!/bin/bash

# Spotlight Rebuild Script for macOS Sequoia with monitoring

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit 1
fi

echo "Starting Spotlight rebuild process..."

# Stop Spotlight
echo "Stopping Spotlight service..."
launchctl bootout system/com.apple.metadata.mds
sleep 2

# Delete Spotlight databases
echo "Removing Spotlight databases..."
rm -rf /System/Volumes/Data/.Spotlight-V100
rm -rf ~/Library/Metadata/CoreSpotlight
sleep 2

# Restart Spotlight
echo "Restarting Spotlight service..."
launchctl bootstrap system /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
sleep 2

# Force reindexing
echo "Forcing reindex of main drive..."
mdutil -i on /
mdutil -E /
sleep 2

# Show initial status
echo "Initial indexing status:"
mdutil -as

echo -e "\nStarting real-time monitoring of Spotlight indexing..."
echo "Press Ctrl+C to stop monitoring"
sleep 2

# Start monitoring
fs_usage -w -f filesys spotlight | grep -v "CACHE\|grep"
