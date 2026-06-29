############################################################
# ResearchLab Core v0.1.0
#
# Base Image for CFD / Combustion / AI Research
#
# Ubuntu 22.04 LTS
############################################################

FROM ubuntu:22.04

############################################################
# Metadata
############################################################

LABEL maintainer="Bravecaveman-cave"
LABEL project="ResearchLab"
LABEL image="core"
LABEL version="0.1.0"
LABEL description="ResearchLab Core Development Environment"

############################################################
# Environment
############################################################

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

############################################################
# System Packages
############################################################

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    sudo \
    git \
    curl \
    wget \
    vim \
    nano \
    unzip \
    zip \
    tree \
    htop \
    net-tools \
    iputils-ping \
    openssh-server \
    build-essential \
    gcc \
    g++ \
    gfortran \
    cmake \
    make \
    pkg-config \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    openmpi-bin \
    libopenmpi-dev \
    ca-certificates \
    locales \
    tzdata \
    rsync \
    software-properties-common \
    && locale-gen en_US.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

############################################################
# Upgrade pip
############################################################

RUN python3 -m pip install --upgrade pip

############################################################
# Create Research User
############################################################

ARG USERNAME=researcher
ARG UID=1000
ARG GID=1000

RUN groupadd --gid ${GID} ${USERNAME} && \
    useradd --uid ${UID} \
            --gid ${GID} \
            --create-home \
            --shell /bin/bash \
            ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

############################################################
# SSH
############################################################

RUN mkdir /var/run/sshd

############################################################
# Workspace
############################################################

RUN mkdir -p /workspace && \
    mkdir -p /envs && \
    mkdir -p /opt/researchlab && \
    chown -R ${USERNAME}:${USERNAME} \
    /workspace \
    /envs \
    /opt/researchlab

############################################################
# Switch User
############################################################

USER ${USERNAME}

WORKDIR /workspace

############################################################
# Python Virtual Environment
############################################################

RUN python3 -m venv /envs/default && \
    /envs/default/bin/pip install --upgrade pip setuptools wheel

############################################################
# Bash Configuration
############################################################

RUN echo "" >> ~/.bashrc && \
    echo "# ResearchLab" >> ~/.bashrc && \
    echo "source /envs/default/bin/activate" >> ~/.bashrc && \
    echo "export PATH=\$PATH:/home/${USERNAME}/.local/bin" >> ~/.bashrc && \
    echo "export OMP_NUM_THREADS=1" >> ~/.bashrc

############################################################
# Default
############################################################

USER root

COPY docker/scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER researcher

CMD ["/entrypoint.sh"]