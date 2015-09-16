#!/bin/bash

# Move sample conf file to config folder. 
mv -n /tmp/utserver.conf /config/utserver.conf

# Copy webui to config folder and link back to 
cp -n /opt/utorrent-server/webui.zip /config/webui.zip
#rm /opt/utorrent-server/webui.zip
#ln -s /config/webui.zip /opt/utorrent-server/webui.zip
chown -R nobody:users /opt/utorrent-server