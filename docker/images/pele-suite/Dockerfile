FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

# 基础工具
RUN apt update && apt install -y \
    git \
    cmake \
    ninja-build \
    g++ \
    gfortran \
    openmpi-bin \
    libopenmpi-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

# 环境变量
ENV CUDA_HOME=/usr/local/cuda
ENV PATH=$CUDA_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# 工作目录
WORKDIR /workspace

# clone PeleLMeX（你也可以换成私有repo）
RUN git clone --recursive https://github.com/AMReX-Combustion/PeleLMeX.git

WORKDIR /workspace/PeleLMeX

# 默认不编译，只提供环境
CMD ["/bin/bash"]