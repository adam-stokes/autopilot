#!/bin/bash
#
# Title: Registering against Landscape
# Description: registers an admin user to login with

. /usr/share/conjure-up/hooklib/common.sh

landscape_exec=$SCRIPTPATH/configure-landscape
while ! `$landscape_exec --admin-email "root@example.com" --admin-name "administrator" --system-email "root@example.com" --maas-host "$MAAS_SERVER" --maas-apikey "$MAAS_OAUTH"`; do sleep 5; done

result_message="Access Autopilot: http://$hostname/account/standalone/openstack l: root@example.com p: ubuntu123"

exposeResult "$result_message" 0 "true"
