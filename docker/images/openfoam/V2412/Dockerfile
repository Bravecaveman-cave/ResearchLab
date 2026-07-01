FROM researchlab/cantera:latest

LABEL maintainer="ResearchLab"

USER root

COPY docker/images/openfoam/install.sh /tmp/install.sh

RUN /bin/bash /tmp/install.sh && \
    rm -f /tmp/install.sh

USER researcher

WORKDIR /researchlab

CMD ["/entrypoint.sh"]