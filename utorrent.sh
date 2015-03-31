#!/bin/bash

exec /sbin/setuser nobody /opt/utorrent-server/utserver -configfile /config/utserver.conf -settingspath /config -daemon