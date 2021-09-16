FROM 172.26.3.78:5000/anydesk_novnc:v1.1

LABEL maintainer="Kur Flamingo <i@k.docker>"

# --proxy-server="https://proxy-ip:proxy-port"
# google-chrome --no-sandbox --kiosk http://192.168.1.175:1188/ -inkognito
RUN apt-get install -y snapd; \
    apt-get install -y libappindicator1 fonts-liberation; \
    apt-get -y install dbus-x11 xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable; \
    apt-get -y install libxss1 lsb-release xdg-utils; \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /tmp/ ; \
    dpkg -i google-chrome-stable_current_amd64.deb;

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
