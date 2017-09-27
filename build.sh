#!/usr/bin/env bash
set -e

version=$(date +"%y.%m.%d.%H.%M")

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

sudo docker build -t leonti/haskell-static-build:$version .
sudo docker push leonti/haskell-static-build:$version

echo $version" is built"
