#!/usr/bin/env bash

set -e

echo "==================================="
echo "Installing Cantera..."
echo "==================================="

# 激活默认 Python 环境
source /envs/default/bin/activate

# 升级 pip
pip install --upgrade pip

# 安装 Cantera
pip install cantera

# 验证安装
python - <<EOF
import cantera as ct
print("===================================")
print("Cantera version:", ct.__version__)
print("Installation successful!")
print("===================================")
EOF