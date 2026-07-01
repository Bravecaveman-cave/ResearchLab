#!/usr/bin/env bash

set -e

echo "[ResearchLab] Starting code-server..."

USERNAME=${USERNAME:-researcher}
HOME_DIR=/home/${USERNAME}

mkdir -p ${HOME_DIR}/.config/code-server
mkdir -p ${HOME_DIR}/.local/share/code-server

exec su - ${USERNAME} -c \
"code-server \
    --bind-addr 0.0.0.0:8080 \
    --auth none \
    /workspace"