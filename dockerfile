FROM debian

RUN apt-get update
RUN apt-get install -y syslog-ng
RUN mkdir /config
RUN cp /etc/syslog-ng/syslog-ng.conf /config/syslog-ng.conf

EXPOSE 514/UDP
EXPOSE 601/TCP 

VOLUME [ "/config" ]
ENTRYPOINT [ "syslog-ng", "-Fevd", "--no-caps", "-f", "/config/syslog-ng.conf" ]