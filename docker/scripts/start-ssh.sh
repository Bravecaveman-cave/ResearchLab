#!/usr/bin/env bash

set -e

echo "[ResearchLab] Starting SSH..."

mkdir -p /var/run/sshd

# Generate host keys if missing
ssh-keygen -A >/dev/null 2>&1

/usr/sbin/sshd

echo "[ResearchLab] SSH started."