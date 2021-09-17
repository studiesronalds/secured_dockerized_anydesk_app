FROM 172.26.3.78:5000/anydesk_novnc:v1.1

LABEL maintainer="Kur Flamingo <i@k.docker>"

RUN apt-get install -y snapd; \
    apt-get install -y libappindicator1 fonts-liberation; \
    apt-get -y install dbus-x11 xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable; \
    apt-get -y install libxss1 lsb-release xdg-utils; \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /tmp/ ; \
    dpkg -i google-chrome-stable_current_amd64.deb;

ADD supervisord.conf /etc/supervisord.conf
ADD startVNC.sh /opt/startVNC.sh

RUN chmod  777 /opt;
RUN chmod 777 /opt/startVNC.sh

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
