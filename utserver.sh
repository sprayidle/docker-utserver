#!/bin/bash

exec /sbin/setuser nobody /opt/utorrent-server/utserver -settingspath /config -configfile /config/utserver.conf
