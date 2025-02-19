################## BASE IMAGE ######################
FROM --platform=${TARGETPLATFORM} ubuntu:24.04

################## METADATA ######################
LABEL base_image="ubuntu:24.04"
LABEL version="1.3.0"
LABEL software="Apptainer"
LABEL software.version="1.3.4"
LABEL about.summary="Apptainer/Singularity is the most widely used container system for HPC."
LABEL about.home="https://apptainer.org/"
LABEL about.documentation="https://apptainer.org/docs/"
LABEL about.license_file="https://github.com/apptainer/apptainer/blob/main/LICENSE.md"
LABEL about.license="BSD-3-Clause-LBNL"
LABEL maintainer="Matthew Galbraith <matthew.galbraith@cuanschutz.edu>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:apptainer/ppa && \
    apt-get install -y apptainer=1.3.4-1~ubuntu24.04.0+stable1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# To add an alias (actually not needed as "singularity" binary also in /usr/bin/)
# RUN echo "alias singularity=/usr/bin/apptainer" >> ~/.bashrc
