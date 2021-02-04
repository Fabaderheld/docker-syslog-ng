FROM debian

RUN apt-get update
RUN apt-get install -y syslog-ng
RUN mkdir /config
RUN cp /etc/syslog-ng/syslog-ng.conf /config/syslog-ng.conf

VOLUME [ "/config" ]
ENTRYPOINT [ "syslog-ng", "-Fevd", "--no-caps", "-f /config/syslog-ng.conf" ]