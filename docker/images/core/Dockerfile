############################################################
#
# ResearchLab Core v1.0
#
# Ubuntu 22.04
# Python
# MPI
# SSH
# code-server
#
############################################################

FROM ubuntu:22.04

############################################################
# Metadata
############################################################

LABEL maintainer="Bravecaveman-cave"
LABEL project="ResearchLab"
LABEL image="core"
LABEL version="1.0.0"

############################################################
# Build Arguments
############################################################

ARG USERNAME=researcher
ARG UID=1000
ARG GID=1000

############################################################
# Environment
############################################################

ENV USERNAME=${USERNAME}
ENV UID=${UID}
ENV GID=${GID}

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

ENV RESEARCHLAB_HOME=/researchlab
ENV WORKSPACE=/workspace
ENV VIRTUAL_ENV=/envs/default

############################################################
# Copy Install Scripts
############################################################

COPY docker/images/core/install /tmp/install
COPY docker/images/core/configure /tmp/configure

############################################################
# Execute Install & Configure Scripts
############################################################

RUN chmod +x /tmp/install/*.sh /tmp/configure/*.sh && \
    /tmp/install/system.sh && \
    /tmp/configure/user.sh && \
    /tmp/install/python.sh && \
    /tmp/install/code-server.sh && \
    /tmp/configure/bash.sh && \
    /tmp/configure/release.sh

############################################################
# Copy Startup Scripts
############################################################

COPY docker/scripts/start-ssh.sh /usr/local/bin/start-ssh.sh
COPY docker/scripts/start-code-server.sh /usr/local/bin/start-code-server.sh
COPY docker/scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x \
    /usr/local/bin/start-ssh.sh \
    /usr/local/bin/start-code-server.sh \
    /entrypoint.sh

############################################################
# Environment
############################################################

ENV PATH="/envs/default/bin:${PATH}"

ENV EDITOR=vim
ENV VISUAL=vim

ENV OMP_NUM_THREADS=1

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

############################################################
# Ports
############################################################

EXPOSE 22
EXPOSE 8080

############################################################
# HealthCheck
############################################################

HEALTHCHECK \
    --interval=30s \
    --timeout=5s \
    --start-period=20s \
    --retries=3 \
CMD curl -fs http://localhost:8080 >/dev/null || exit 1

############################################################
# Workspace
############################################################

WORKDIR /researchlab

############################################################
# Entrypoint
############################################################

ENTRYPOINT ["/entrypoint.sh"]