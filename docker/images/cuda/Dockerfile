FROM researchlab/base:latest

LABEL maintainer="ResearchLab"
LABEL description="ResearchLab CUDA Base Image"

COPY install.sh /tmp/install.sh

RUN chmod +x /tmp/install.sh && \
    /tmp/install.sh && \
    rm /tmp/install.sh

WORKDIR /workspace

CMD ["/bin/bash"]