#!/bin/bash

# Copy webui to config folder and link back to /opt/utorrent-server
cp -n /opt/utorrent-server/webui.zip /config/webui.zip
rm /opt/utorrent-server/webui.zip
ln -s /config/webui.zip /opt/utorrent-server/webui.zip

# Copy .conf file to config folder and link back to /opt/utorrent-server
cp -n /opt/utorrent-server/utserver.conf /config/utserver.conf
rm /opt/utorrent-server/utserver.conf
ln -s /config/utserver.conf /opt/utorrent-server/utserver.conf