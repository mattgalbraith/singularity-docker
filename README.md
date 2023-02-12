[![Docker Image CI](https://github.com/mattgalbraith/singularity-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mattgalbraith/singularity-docker/actions/workflows/docker-image.yml)
# singularity-docker
## Build Docker container for Apptainer/Singularity software.  
Apptainer/Singularity is the most widely used container system for HPC.  
https://apptainer.org/docs/

### 1. Build the Docker Image
NB: if running this on Mac with Apple silicon (M1/M2), by default Docker will pull the ARM/aarch64 version of CentOS 7
(and any subsequent conversion of Docker images will use same architecture). Solution is to specify `--platform linux/amd64`.
Architecture can be checked from within container with `arch` (should return x86_64).
```bash
# capture current working directory (should be the top-level singularity-docker directory containing Dockerfile)
WORKING_DIR=`pwd`
docker build -t singularity:1.1.5 . # tag should match software version
```
* Can do this on [Google shell](https://shell.cloud.google.com)

### 2. Test this tool from the command line:
Check that we can call the tool now encapsulated within the container
```bash
docker run -it --rm singularity:1.1.5 arch
docker run -it --rm singularity:1.1.5 apptainer -h # can run as either apptainer or singularity
docker run -it --rm singularity:1.1.5 singularity -h # can run as either apptainer or singularity
```


