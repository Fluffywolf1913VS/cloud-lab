#!/usr/bin/env bash
# Example commands used in this lab.
# Replace FS_ID with your own Amazon EFS file system ID.

set -euo pipefail

FS_ID="fs-xxxxxxxxxxxxxxxxx"
MOUNT_DIR="data"

sudo yum install -y amazon-efs-utils
mkdir -p "$MOUNT_DIR"
sudo mount -t efs -o tls "${FS_ID}:/" "$MOUNT_DIR"
cd "$MOUNT_DIR"

# Example shared-file test:
echo "efs-1 mounted in site A" | sudo tee -a efs-1-setup.log
cat efs-1-setup.log
