#!/bin/bash

. /usr/share/conjure-up/hooklib/common.sh

services=("haproxy" \
          "landscape-server" \
          "rabbitmq-server" \
          "postgresql")

checkUnitsForErrors $services

if [ $(unitJujuStatus haproxy 0) != "active" ]; then
    exposeResult "HAProxy is not ready yet" 0 "false"
fi

if [ $(unitJujuStatus landscape-server 0) != "idle" ]; then
    exposeResult "Landscape is not ready yet" 0 "false"
fi

if [ $(unitJujuStatus rabbitmq-server 0) != "idle" ]; then
    exposeResult "rabbitmq is not ready yet" 0 "false"
fi

if [ $(unitJujuStatus postgresql 0) != "idle" ]; then
    exposeResult "postgresql is not ready yet" 0 "false"
fi


exposeResult "Applications ready" 0 "true"
