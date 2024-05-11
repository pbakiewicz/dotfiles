#!/bin/bash

SNAPSHOT_BASE="/.snapshots"
DATE=$(date +%m%d)
SNAPSHOT_NAME="root-${DATE}"
SNAPSHOT_PATH="${SNAPSHOT_BASE}/${SNAPSHOT_NAME}"

echo "Creating Btrfs snapshot: ${SNAPSHOT_PATH}"
sudo btrfs subvolume snapshot / "${SNAPSHOT_PATH}"

# Check if the snapshot was created successfully
if [ $? -eq 0 ]; then
    echo "Snapshot successfully created."
else
    echo "Failed to create snapshot."
    exit 1
fi


sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su
