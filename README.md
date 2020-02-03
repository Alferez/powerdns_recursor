
PowerDNS Recursor Server
========================
     www.alferez.es


To run:

docker run --name powerdns -d -p 53:53/udp -p 53:53 alferez/powerdns_recursor

ENVIRONMENT VARIABLES:
----------------------

ALLOWIP -> Set allowed IP to use DNS Server (Default: 0.0.0.0/0)

THREADS -> Set Thread (Default 2

TTL -> Set Cache TTL (Default 36000)

ENTRIES -> Set max Cache Entries (Default 500000)

WEBSERVER -> Enable Webserver (Default no)

WEBPASS -> Set default password for Web Server

WEBPORT -> Set web tcp port (Default 8082)

Configure DNS Server:
---------------------

Run docker wit --dns=XXXXX values. Use one --dns for server.

Example: docker run --name PowerDNS -d -p 53:53/udp -p 53:53 --dns=1.1.1.1 --dns=8.8.8.8 --dns=9.9.9.9 alferez/powerdns_recursor



