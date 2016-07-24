#!/bin/bash

# Copy webui to config folder and link back to /opt/utorrent-server
cp -n /opt/utorrent-server/webui.zip /config/webui.zip
rm /opt/utorrent-server/webui.zip
ln -s /config/webui.zip /opt/utorrent-server/webui.zip
chown -R nobody:users /opt/utorrent-server