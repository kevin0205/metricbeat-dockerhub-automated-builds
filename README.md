# DockerHub Automated Builds Build Metricbeat
Test DockerHub Automated Builds：Failure
1. Use Docker Multi-Stage Builds  
2. Use binfmt_misc / qemu-user-static (Docker Images Setup) [Not Support：Setup Failure]  
3. Use Docker Buildx  
4. Use DockerHub Automated Builds  
5. Build Multi Architecture Docker Image (amd64 / arm64)  
6. Auto Push DockerHub  

# DockerHub Automated Builds Hosted Runners (Build system information)
# Cloud Instance
    Amazon Web Services (AWS) EC2

# Custom Operating System and Version：No
    Nothing

# lsb_release -a
    Distributor ID: Ubuntu
    Description: Ubuntu 16.04.6 LTS
    Release: 16.04
    Codename: xenial

# uname -r
    Ubuntu 16.04.6 LTS
    4.4.0-1060-aws

# docker version
    Client: Docker Engine - Community
     Version: 19.03.11
     API version: 1.40
     Go version: go1.13.10
     Git commit: 42e35e61f3
     Built: Mon Jun 1 09:12:41 2020
     OS/Arch: linux/amd64
     Experimental: true

    Server: Docker Engine - Community
     Engine:
      Version: 19.03.8
      API version: 1.40 (minimum version 1.12)
      Go version: go1.12.17
      Git commit: afacb8b7f0
      Built: Wed Mar 11 01:24:30 2020
      OS/Arch: linux/amd64
      Experimental: false
     containerd:
      Version: 1.2.13
      GitCommit: 7ad184331fa3e55e52b890ea95e65ba581ae3429
     runc:
      Version: 1.0.0-rc10
      GitCommit: dc9208a3303feef5b3839f4323d9beb36df0a9dd
     docker-init:
      Version: 0.18.0
      GitCommit: fec3683

# docker buildx version
    github.com/docker/buildx v0.4.1 bda4882a65349ca359216b135896bddc1d92461c
