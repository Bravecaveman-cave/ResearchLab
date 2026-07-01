#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

echo "========================================"
echo "Installing OpenFOAM..."
echo "========================================"

apt-get update

apt-get install -y \
    wget \
    curl \
    gnupg \
    lsb-release \
    ca-certificates

wget -q -O - https://dl.openfoam.com/add-debian-repo.sh | bash

apt-get update

apt-get install -y \
    openfoam2412-default

apt-get clean
rm -rf /var/lib/apt/lists/*

echo ""

echo "source /usr/lib/openfoam/openfoam2412/etc/bashrc" >> /etc/bash.bashrc
echo "source /usr/lib/openfoam/openfoam2412/etc/bashrc" >> /root/.bashrc

echo ""
echo "OpenFOAM installed successfully."