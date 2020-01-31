
PowerDNS Recursor Server
========================
          www.alferez.es


To run:

docker run --name powerdns -d -p 53:53/udp  alferez/powerdns_recursor

ENVIRONMENT VARIABLES:
----------------------

ALLOWIP - Set allowed IP to use DNS Server (Default: 0.0.0.0/0)

THREADS - Set Thread (Default 2

TTL - Set Cache TTL (Default 36000)

ENTRIES - Set max Cache Entries (Default 500000)

WEBSERVER - Enable Webserver (Default no)

WEBPASS - Set default password for Web Server



Configure DNS Server:
---------------------

Run docker wit --dns=XXXXX values. Use one --dns for server.




