FROM ubuntu:focal

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get -y install python2 python-is-python2 xvfb x11vnc xdotool wget tar supervisor net-tools fluxbox gnupg2 npm sudo

RUN chmod -R a+rwX  /usr/local/;
RUN chmod -R a+rwX  /root;

ADD main.js /opt/main.js
RUN chmod -R a+rwX  /opt/main.js;


ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
RUN printf "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk.list

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	anydesk libpolkit-gobject-1-0 \
	locales tzdata \
	lsb-release pciutils \
	; exit 0 \
	&& chmod -R 755 /usr/share/anydesk \
	&& chmod 755 /var/lib/dpkg/info/anydesk.p* \
	&& dpkg --configure anydesk \
	&& apt-get install -f \
	&& apt-get update \
	&& apt-get upgrade -y

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0

ARG UNAME=upwork
ARG UID=1000
ARG GNAME=$UNAME
ARG GID=1000
ARG GROUPS=$GNAME


RUN groupadd -g $GID $GNAME \
&& useradd --create-home -d /home/$UNAME -g $GID -u $UID $UNAME \
&& usermod -a -G $GROUPS $UNAME 


RUN  groupadd supervisor \
	 && usermod -a -G supervisor $UNAME \
	 && usermod -a -G sudo $UNAME

RUN adduser $UNAME sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chmod -R a+rwX  /usr/local/;
RUN chmod -R a+rwX  /root;
RUN chmod -R a+rwX  /opt;

USER $UNAME

WORKDIR /root/
RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /tmp/ && mv /tmp/noVNC-1.1.0 /opt/novnc && ln -s /opt/novnc/vnc_lite.html /opt/novnc/index.html && \
    wget -O - https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar -xzv -C /tmp/ && mv /tmp/websockify-0.9.0 /opt/novnc/utils/websockify

ENV HOME /home/$UNAME

RUN cd /opt; \
	npm install -g electron electron-open-url --unsafe-perm=true --allow-root; \
	npm install nightmare; \
	npm install jquery; \
	echo Qwerty12345@ | sudo anydesk --set-password

USER root

RUN apt-get install -y libgconf-2-4 libgtk-3-0 libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev libasound2;

ENV HOME /root

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
