#!/usr/bin/env bash
set -e

echo "Updating package index..."

apt-get update

echo "Installing base packages..."

DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    wget \
    vim \
    nano \
    htop \
    unzip \
    zip \
    python3 \
    python3-pip \
    python3-venv \
    sudo \
    ca-certificates \
    openssh-client \
    pkg-config

apt-get clean
rm -rf /var/lib/apt/lists/*