#!/bin/bash
set -exv

if [ -z "$HUB_PORT_4444_TCP_ADDR" ]; then
  echo Not linked with a running Hub container 1>&2
  exit 1
fi

if [ ! -e /opt/appium/configuration.json ]; then
  echo No Selenium Node configuration file, will be use a default one 1>&2

  mkdir -p /opt/appium
  cat /configuration.template.json > /opt/appium/configuration.json

  for name in HUB_PORT_4444_TCP_ADDR HUB_PORT_4444_TCP_PORT ; do
    eval value=\$$name
    sed -i "s|\${${name}}|${value}|g" /opt/appium/configuration.json
  done
fi

appium-doctor --android && \
appium --nodeconfig /opt/appium/configuration.json
