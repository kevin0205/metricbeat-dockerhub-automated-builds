#!/bin/bash

#env DOCKER_CLI_EXPERIMENTAL=enabled
#env DOCKER_REPO=kevin0205/metricbeat
#env TARGET_ARCH=linux/amd64,linux/arm64
#env TARGET_VERSION=7.5.2

export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_REPO=kevin0205/metricbeat
export TARGET_ARCH=linux/amd64,linux/arm64
export TARGET_VERSION=7.5.2

#apt-get update -y
#apt-get upgrade -y
apt-get install -y wget sudo

# Install Docker
#curl -fsSL https://get.docker.com | sudo sh
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
apt-get update -y
#apt-cache madison docker-ce
#apt-cache madison docker-ce-cli
#apt-cache madison containerd.io
#apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt-get install -y docker-ce-cli=5:19.03.12~3-0~ubuntu-$(lsb_release -cs) docker-ce=5:19.03.12~3-0~ubuntu-$(lsb_release -cs) containerd.io=1.2.13-2
sudo service docker restart

# Install Docker Buildx
mkdir -p $HOME/.docker/cli-plugins
wget -O $HOME/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-amd64
chmod 0750 $HOME/.docker/cli-plugins/docker-buildx
echo '{"experimental":"enabled"}' | sudo tee $HOME/.docker/config.json

# Install QEMU
# Ubuntu 20.04 LTS (Focal Fossa) / Kernel Version: 5.4.0-37-generic
#docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
# Ubuntu 16.04.6 LTS (Xenial Xerus) / Kernel Version: 4.4.0-1060-aws
docker run --rm --privileged multiarch/qemu-user-static:register --reset
docker buildx create --use --name xbuilder

# Check Version
lsb_release -a
uname -r
docker version
docker buildx version
ls -al /proc/sys/fs/binfmt_misc/
docker buildx inspect xbuilder --bootstrap
docker buildx ls

echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin &> /dev/null
TAG="${TARGET_VERSION:-latest}"
docker buildx build \
    --progress plain \
    --platform=$TARGET_ARCH \
    --build-arg VERSION=$TARGET_VERSION \
    -t $DOCKER_REPO:$TAG \
    -t $DOCKER_REPO \
    --push \
    .
