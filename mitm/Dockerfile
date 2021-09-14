FROM johnmccabe/mitmweb:v1.0

RUN apk update && apk add --no-cache supervisor openssh nginx

ADD supervisord.conf /etc/supervisord.conf

ADD mock.py /opt/mock.py

ADD postman.py /opt/postman.py

RUN chmod -R a+rwX /opt/mock.py; \
    mkdir /opt/ca; \
    mkdir /opt/logs;

EXPOSE 8080

ENTRYPOINT []

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]