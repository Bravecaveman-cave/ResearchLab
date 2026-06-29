#!/usr/bin/env bash
set -e

echo "Installing CUDA dependencies..."

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gnupg2 \
    software-properties-common \
    lsb-release \
    ca-certificates \
    wget

apt-get clean
rm -rf /var/lib/apt/lists/*

echo "CUDA dependency installation completed."