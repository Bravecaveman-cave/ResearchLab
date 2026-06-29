FROM researchlab/core:22.04

USER root

COPY docker/images/cantera/install.sh /tmp/install.sh

RUN chmod +x /tmp/install.sh && \
    /tmp/install.sh && \
    rm /tmp/install.sh

USER researcher

WORKDIR /researchlab

CMD ["/entrypoint.sh"]