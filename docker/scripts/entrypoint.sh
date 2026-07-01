#!/usr/bin/env bash

set -e

echo "========================================="
echo "      ResearchLab Core v1.0"
echo "========================================="

# Start SSH
/usr/local/bin/start-ssh.sh

# Print release information
if [ -f /etc/researchlab-release ]; then
    cat /etc/researchlab-release
fi

echo ""
echo "Workspace : /workspace"
echo "Research  : /researchlab"
echo "code-server : http://0.0.0.0:8080"
echo "SSH         : 22"
echo "========================================="
echo ""

# Start code-server (foreground)
exec /usr/local/bin/start-code-server.sh