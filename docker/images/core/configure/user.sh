#!/usr/bin/env bash

set -e

echo "========================================="
echo "Configuring ResearchLab User..."
echo "========================================="

############################################################
# Default User
############################################################

USERNAME=${USERNAME:-researcher}
UID=${UID:-1000}
GID=${GID:-1000}

############################################################
# Create Group
############################################################

if ! getent group ${USERNAME} >/dev/null; then
    groupadd \
        --gid ${GID} \
        ${USERNAME}
fi

############################################################
# Create User
############################################################

if ! id ${USERNAME} >/dev/null 2>&1; then

    useradd \
        --uid ${UID} \
        --gid ${GID} \
        --create-home \
        --shell /bin/bash \
        ${USERNAME}

fi

############################################################
# Sudo
############################################################

echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" \
    > /etc/sudoers.d/${USERNAME}

chmod 0440 /etc/sudoers.d/${USERNAME}

############################################################
# Workspace
############################################################

mkdir -p \
    /researchlab \
    /workspace \
    /envs \
    /opt/researchlab \
    /home/${USERNAME}/.local \
    /home/${USERNAME}/.cache \
    /home/${USERNAME}/.config \
    /home/${USERNAME}/.ssh

############################################################
# Ownership
############################################################

chown -R ${USERNAME}:${USERNAME} \
    /researchlab \
    /workspace \
    /envs \
    /opt/researchlab \
    /home/${USERNAME}

############################################################
# Git
############################################################

su - ${USERNAME} -c "git config --global init.defaultBranch main"
su - ${USERNAME} -c "git config --global pull.rebase false"
su - ${USERNAME} -c "git config --global core.editor vim"

############################################################
# Finished
############################################################

echo "========================================="
echo "User Configuration Finished"
echo "========================================="

############################################################
# Default Password
############################################################

PASSWORD=${PASSWORD:-12qwaszx}
echo "${USERNAME}:${PASSWORD}" | chpasswd