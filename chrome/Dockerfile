FROM alpine

LABEL maintainer="Naveen S R <srnaveen2k@yahoo.com>"

ENV DISPLAY :52
ENV RESOLUTION 1920x1080x24

RUN apk add sudo bash supervisor xfce4 xvfb xdpyinfo lightdm-gtk-greeter x11vnc xfce4-terminal chromium python3 git openssl && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    echo 'CHROMIUM_FLAGS="--chrome-frame --kiosk http://upwork.com --disable-gpu --disable-software-rasterizer --disable-dev-shm-usage --no-sandbox"' >> /etc/chromium/chromium.conf && \
    dbus-uuidgen > /var/lib/dbus/machine-id

RUN adduser -h /home/user -s /bin/bash -S -D user && echo "user:passwd" | chpasswd && \
    echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user
WORKDIR /home/user

RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /tmp/ && mv /tmp/noVNC-1.1.0 /home/user/noVNC/ && ln -s /home/user/noVNC/vnc_lite.html /home/user/noVNC/index.html && \
    wget -O - https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar -xzv -C /tmp/ && mv /tmp/websockify-0.9.0 /home/user/noVNC/utils/websockify
COPY startVNC.sh /home/user/
RUN sudo chown user: /home/user/startVNC.sh && \
    chmod +x /home/user/startVNC.sh

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]