#!/usr/bin/env bash

commit=$(git describe --tags --long --always)
branch=$(git rev-parse --abbrev-ref HEAD)

for version in `cat appium_versions.txt`; do
    docker build --pull --build-arg APPIUM_VERSION=${version} -t gentilhommefx/node-appium:${version} .
done

