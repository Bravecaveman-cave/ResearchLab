#!/usr/bin/env bash

set -e

echo "========================================="
echo "Configuring Bash Environment..."
echo "========================================="

USERNAME=${USERNAME:-researcher}

BASHRC=/home/${USERNAME}/.bashrc

cat > ${BASHRC} <<'EOF'
############################################################
# ResearchLab Environment
############################################################

# Python Virtual Environment
if [ -d /envs/default ]; then
    source /envs/default/bin/activate
fi

############################################################
# Environment Variables
############################################################

export RESEARCHLAB_HOME=/researchlab
export WORKSPACE=/workspace
export PATH=$PATH:$HOME/.local/bin

export EDITOR=vim
export VISUAL=vim

export OMP_NUM_THREADS=1

export PYTHONUNBUFFERED=1
export PYTHONDONTWRITEBYTECODE=1

############################################################
# History
############################################################

export HISTSIZE=50000
export HISTFILESIZE=50000

HISTCONTROL=ignoredups

shopt -s histappend

############################################################
# Prompt
############################################################

PS1="\[\033[1;32m\]\u@ResearchLab\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ "

############################################################
# Aliases
############################################################

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cls='clear'

alias python='python3'
alias pip='pip3'

############################################################
# Git
############################################################

alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

############################################################
# Docker
############################################################

alias rebuild='source ~/.bashrc'

############################################################
# ResearchLab
############################################################

alias workspace='cd /workspace'
alias research='cd /researchlab'

############################################################
# Welcome
############################################################

echo ""
echo "========================================="
echo "      ResearchLab Core v1.0"
echo "========================================="
echo "Workspace : /workspace"
echo "Research  : /researchlab"
echo ""

EOF

chown ${USERNAME}:${USERNAME} ${BASHRC}

echo "========================================="
echo "Bash Configuration Finished"
echo "========================================="