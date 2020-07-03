#!/bin/bash

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
