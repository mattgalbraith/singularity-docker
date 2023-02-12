################## BASE IMAGE ######################
FROM --platform=linux/amd64 centos:7

################## METADATA ######################
LABEL base_image="centos:7"
LABEL version="1"
LABEL software="Apptainer"
LABEL software.version="1.1.5-2.el7"
LABEL about.summary="Apptainer/Singularity is the most widely used container system for HPC."
LABEL about.home="https://apptainer.org/"
LABEL about.documentation="https://apptainer.org/docs/"
LABEL about.license_file="https://github.com/apptainer/apptainer/blob/main/LICENSE.md"
LABEL about.license="BSD-3-Clause-LBNL"

################## MAINTAINER ######################
MAINTAINER Matthew Galbraith <matthew.galbraith@cuanschutz.edu>

RUN yum -y upgrade && \
	yum -y install bash epel-release tar && \
	yum -y install apptainer-1.1.5-2.el7

# To add an alias (actually not needed as "singularity" binary also in /usr/bin/)
# RUN echo "alias singularity=/usr/bin/apptainer" >> ~/.bashrc
