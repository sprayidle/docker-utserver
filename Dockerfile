FROM phusion/baseimage:0.9.11
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
RUN \
usermod -u 99 nobody && \
usermod -g 100 nobody && \
usermod -d /home nobody && \
chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

ADD http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-debian-6-0/track/beta/ /tmp/utorrent.tar.gz
ADD http://launchpadlibrarian.net/103002189/libssl0.9.8_0.9.8o-7ubuntu3.1_amd64.deb /tmp/

RUN dpkg -i /tmp/libssl0.9.8_0.9.8o-7ubuntu3.1_amd64.deb && cd /opt/ && tar xvzf /tmp/utorrent.tar.gz && ln -s /opt/$(ls /opt/|tail -1) /opt/utorrent-server && rm -f /tmp/utorrent.tar.gz /tmp/libssl0.9.8_0.9.8o-7ubuntu3.1_amd64.deb

# Expose the port (you also need to portmap this if you're behind a NAT router)
EXPOSE 6881

# Expose the web interface
EXPOSE 8080

# Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# ADD utserver.conf /tmp/utserver.conf
# RUN mv -n /tmp/utserver.conf /config/utserver.conf

# ADD webui.zip /tmp/webui.zip
# RUN mv -n /tmp/webui.zip /config/webui.zip
# RUN rm /opt/utorrent-server/webui.zip
# RUN ln -s /config/webui.zip /opt/utorrent-server/webui.zip

RUN chown -R nobody:users /opt/utorrent-server

# Add uTorrent to runit
RUN mkdir /etc/service/utorrent
ADD utorrent.sh /etc/service/utorrent/run
RUN chmod +x /etc/service/utorrent/run

# CMD ["/opt/utorrent-server/utserver", "-settingspath", "/config", "-daemon"]