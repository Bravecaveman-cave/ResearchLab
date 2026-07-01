#!/usr/bin/env bash

set -e

echo "========================================="
echo "Generating ResearchLab Release..."
echo "========================================="

############################################################
# Variables
############################################################

VERSION="1.0.0"
UBUNTU_VERSION=$(grep VERSION_ID /etc/os-release | cut -d'"' -f2)
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
MPI_VERSION=$(mpirun --version | head -n1)
GIT_VERSION=$(git --version)
BUILD_DATE=$(date +"%Y-%m-%d %H:%M:%S UTC")

############################################################
# Release File
############################################################

cat > /etc/researchlab-release <<EOF
==================================================
ResearchLab Core
==================================================

Version      : ${VERSION}
Ubuntu       : ${UBUNTU_VERSION}
Python       : ${PYTHON_VERSION}
Git          : ${GIT_VERSION}
MPI          : ${MPI_VERSION}

ResearchLab  : /researchlab
Workspace    : /workspace

Build Time   : ${BUILD_DATE}

==================================================
EOF

############################################################
# Helper Command
############################################################

cat > /usr/local/bin/researchlab-info <<'EOF'
#!/usr/bin/env bash

if [ -f /etc/researchlab-release ]; then
    cat /etc/researchlab-release
else
    echo "ResearchLab release information not found."
fi
EOF

chmod +x /usr/local/bin/researchlab-info

############################################################
# Version Command
############################################################

cat > /usr/local/bin/researchlab-version <<'EOF'
#!/usr/bin/env bash
echo "ResearchLab Core v1.0.0"
EOF

chmod +x /usr/local/bin/researchlab-version

############################################################
# Finished
############################################################

echo "========================================="
echo "Release Configuration Finished"
echo "========================================="