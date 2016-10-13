#!/usr/bin/env bash

for version in `cat appium_versions.txt`; do
    docker push gentilhommefx/node-appium:${version}
done

