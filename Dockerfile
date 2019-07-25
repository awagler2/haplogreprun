FROM ubuntu:latest
USER root
RUN apt-get update && apt-get install -yq \
    bcftools\
    bzip2 \
    default-jre \
    git \
    graphviz\
    ipython\
    libgraphviz-dev\
    python-dev \
    wget \
    vim 

ARG WRKD=/tmp/work 
ARG SCRD=/tmp/scripts 
ARG PREFIX=/tmp/haplogrep

RUN mkdir ${WRKD} ${SCRD} ${PREFIX}
RUN cd ${PREFIX} && \
    wget https://github.com/seppinho/haplogrep-cmd/releases/download/v2.1.24/haplogrep-2.1.24.jar && \
    wget ftp://ftp.ensembl.org/pub/grch37/current/fasta/homo_sapiens/dna/Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz && \
    gunzip Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz

ADD run_haplogrep.sh ${SCRD}/run_haplogrep.sh
RUN chmod +x ${SCRD}/run_haplogrep.sh

WORKDIR ${WRKD}

ENTRYPOINT ["/tmp/scripts/run_haplogrep.sh"]
