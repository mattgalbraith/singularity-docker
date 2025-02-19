[![Docker Image CI](https://github.com/mattgalbraith/singularity-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/mattgalbraith/singularity-docker/actions/workflows/docker-image.yml)
# singularity-docker
## Build Docker container for Apptainer/Singularity software.  
Apptainer/Singularity is the most widely used container system for HPC.  
https://apptainer.org/docs/

### 1. Build the Docker Image
NB: if running this on Mac with Apple silicon (M1/M2), by default Docker will pull the ARM/aarch64 version of base image
(and any subsequent conversion of Docker images will use same architecture). Solution is to specify `--platform linux/amd64`.
Architecture can be checked from within container with `arch` (should return x86_64).
```bash
docker build --build-arg TARGETPLATFORM=linux/amd64 -t singularity:1.3.4 . # tag should match software version
```
* Can do this on [Google shell](https://shell.cloud.google.com)

### 2. Test this tool from the command line:
Check that we can call the tool now encapsulated within the container
```bash
docker run -it --rm singularity:1.3.4 arch
docker run -it --rm singularity:1.3.4 apptainer -h # can run as either apptainer or singularity
docker run -it --rm singularity:1.3.4 singularity -h # can run as either apptainer or singularity
```


