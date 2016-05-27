#!/bin/bash
#
# Title: Registering against Landscape
# Description: Registring an admin user to login with

. /usr/share/conjure-up/hooklib/common.sh

landscape_exec=$SCRIPTPATH/configure-landscape

if [ $(unitStatus landscape-server 0) = "error" ]; then
    exposeResult "There is an error with landscape-server, please check juju status." 1 "false"
fi

$landscape_exec --admin-email "root@example.com" --admin-password "ubuntu123" --admin-name "administrator" --system-email "root@example.com" --maas-host "$MAAS_SERVER" --maas-apikey "$MAAS_OAUTH"
RET=$?

if [ $RET -gt 0 ]; then
    exposeResult "Unable to register against Landscape server, please check your deployment." 1 "false"
fi

result_message="Access Autopilot: http://$hostname/account/standalone/openstack l: root@example.com p: ubuntu123"

exposeResult "$result_message" 0 "true"
