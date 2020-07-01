#!/bin/bash

#env DOCKER_CLI_EXPERIMENTAL=enabled
env DOCKER_REPO=kevin0205/metricbeat
env TARGET_ARCH=linux/amd64,linux/arm64
env TARGET_VERSION=7.5.2

#apt-get update -y
#apt-get upgrade -y
#apt-get install -y wget sudo

#curl -fsSL https://get.docker.com | sh
#apt-get remove -y docker docker-engine docker.io containerd runc
#apt-get install -y \
#    apt-transport-https \
#    ca-certificates \
#    curl \
#    gnupg-agent \
#    software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#apt-key fingerprint 0EBFCD88
#add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#apt-cache madison docker-ce
#apt-cache madison docker-ce-cli
#apt-cache madison containerd.io
#apt-get install -y docker-ce docker-ce-cli containerd.io
#apt-get update -y docker-ce docker-ce-cli containerd.io
#apt-get install -y docker-ce-cli=5:19.03.11~3-0~ubuntu-$(lsb_release -cs) docker-ce=5:19.03.11~3-0~ubuntu-$(lsb_release -cs) containerd.io=1.2.13-2
#service docker restart

# Install Docker Buildx
mkdir -p $HOME/.docker/cli-plugins
wget -O $HOME/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-amd64
chmod 0750 $HOME/.docker/cli-plugins/docker-buildx
echo '{"experimental":"enabled"}' | sudo tee $HOME/.docker/config.json
#service docker restart

# Check OS / Kernel Version
#lsb_release -a
#uname -r

# Ubuntu 20.04 LTS (Focal Fossa) / Kernel Version: 5.4.0-37-generic
#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
# Ubuntu 16.04.6 LTS (Xenial Xerus) / Kernel Version: 4.4.0-1060-aws
docker run --rm --privileged multiarch/qemu-user-static:register --reset

docker buildx create --use --name xbuilder
docker buildx inspect xbuilder --bootstrap
docker buildx ls

# Check Version
#docker version
#docker buildx version
ls -al /proc/sys/fs/binfmt_misc/
