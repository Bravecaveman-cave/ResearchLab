############################################################
# ResearchLab Core v0.2
#
# Base Image for CFD / Combustion / AI Research
############################################################

FROM ubuntu:22.04

############################################################
# Metadata
############################################################

LABEL maintainer="Bravecaveman-cave"
LABEL project="ResearchLab"
LABEL image="core"
LABEL version="0.2.0"
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

RUN apt-get update --fix-missing && \
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
    software-properties-common && \
    locale-gen en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
    useradd \
        --uid ${UID} \
        --gid ${GID} \
        --create-home \
        --shell /bin/bash \
        ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

############################################################
# SSH
############################################################

RUN mkdir -p /var/run/sshd

############################################################
# Workspace
############################################################

RUN mkdir -p /researchlab && \
    mkdir -p /workspace && \
    mkdir -p /envs && \
    mkdir -p /opt/researchlab && \
    chown -R ${USERNAME}:${USERNAME} \
        /researchlab \
        /workspace \
        /envs \
        /opt/researchlab

############################################################
# Switch User
############################################################

USER ${USERNAME}

WORKDIR /researchlab

############################################################
# Python Virtual Environment
############################################################

RUN python3 -m venv /envs/default && \
    /envs/default/bin/pip install --upgrade pip setuptools wheel

############################################################
# Default Python Environment
############################################################

ENV PATH="/envs/default/bin:${PATH}"

############################################################
# Bash Configuration
############################################################

RUN echo "" >> ~/.bashrc && \
    echo "# ResearchLab" >> ~/.bashrc && \
    echo "source /envs/default/bin/activate" >> ~/.bashrc && \
    echo "export PATH=\$PATH:/home/${USERNAME}/.local/bin" >> ~/.bashrc && \
    echo "export OMP_NUM_THREADS=1" >> ~/.bashrc

############################################################
# Entrypoint
############################################################

USER root

COPY docker/scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER ${USERNAME}

WORKDIR /researchlab

CMD ["/entrypoint.sh"]