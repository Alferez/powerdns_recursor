FROM debian:11
MAINTAINER Jose A Alferez <correo@alferez.es>

ENV DEBIAN_FRONTEND noninteractive

#### Configure TimeZone
ENV TZ=Europe/Madrid
RUN echo "Europe/Madrid" > /etc/timezone && rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime && dpkg-reconfigure tzdata

#### Instalamos dependencias, Repositorios y Paquetes
RUN apt-get update && apt-get install -y --fix-missing wget curl nano rsyslog gnupg

### Configuramos el repo de powerdns
RUN echo "deb [arch=amd64] http://repo.powerdns.com/debian bullseye-rec-46 main" | tee /etc/apt/sources.list.d/pdns.list
COPY ./assets/preferences /etc/apt/preferences.d/pdns
RUN curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add - 
RUN apt-get update; apt-get install -y --fix-missing pdns-recursor
RUN mkdir -m777 /var/run/pdns-recursor

### Limpiamos
RUN apt-get clean && rm -rf /tmp/* /var/tmp/* && rm -rf /var/lib/apt/lists/*

### Add Entrypoing
COPY ./assets/start /powerdns
RUN chmod +x /powerdns
ENTRYPOINT /powerdns

### Personalizacion
RUN echo "alias l='ls -la'" >> /root/.bashrc && echo "export TERM=xterm" >> /root/.bashrc && echo 'Acquire::ForceIPv4 "true";' | tee /etc/apt/apt.conf.d/99force-ipv4

EXPOSE 53/udp
EXPOSE 53

WORKDIR /root
