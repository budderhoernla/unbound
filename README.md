# unbound

Docker-Compose solution to set-up a dnssec-validating unbound instance on an arm32v7 machine. Tested on Odroid HC1.

The structure is setup to have all relevant files to run unbound reside under one directory (core), which is mapped to /etc/unbound in the container. This makes managing/backing up your configuration from the host easier - no access to the container is needed.

The package contains an init_run.sh script that will check if various files needed for unbound to run are present, and if they aren't it creates / fetches them.

Modifications are required to:
- docker-compose.yml: Change the IP in the port-mapping section to IP of your hosts network adapter.
- core/unbound.conf: change to your liking, I used the examples provided by https://calomel.org/unbound_dns.html to pre-configure this unbound.conf.
