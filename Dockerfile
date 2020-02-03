FROM debian:10
MAINTAINER Jose A Alferez <correo@alferez.es>

ENV DEBIAN_FRONTEND noninteractive

#### Configure TimeZone
ENV TZ=Europe/Madrid
RUN echo "Europe/Madrid" > /etc/timezone && rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime && dpkg-reconfigure tzdata

#### Instalamos dependencias, Repositorios y Paquetes
RUN apt-get update && apt-get install -y --fix-missing wget curl nano pdns-recursor rsyslog


### Limpiamos
RUN apt-get clean
RUN rm -rf /tmp/* /var/tmp/*
RUN rm -rf /var/lib/apt/lists/*

### Add Entrypoing
COPY ./assets/start /powerdns
RUN chmod +x /powerdns
entrypoint /powerdns

### Personalizacion
RUN echo "alias l='ls -la'" >> /root/.bashrc
RUN echo "export TERM=xterm" >> /root/.bashrc
RUN echo 'Acquire::ForceIPv4 "true";' | tee /etc/apt/apt.conf.d/99force-ipv4

EXPOSE 53/udp
EXPOSE 53

WORKDIR /root
