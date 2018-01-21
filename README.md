# unbound

Docker-Compose solution to set-up a dnssec-validating unbound instance on an arm32v7 machine. Tested on Odroid HC1.

The package contains an init_run.sh script that will check if various files needed for unbound to run are present, and if they aren't it creates / fetches them.

The structure is setup to have all relevant files to run unbound reside under one directory (unbound/core), which is mapped to /etc/unbound in the container. This makes managing/backing up your configuration from the host easier - no access to the container is needed.

Modifications are required to:
- docker-compose.yml: Change the IP in the port-mapping section to IP of your hosts network adapter.
- core/unbound.conf: change to your liking, I used the examples provided [here](https://calomel.org/unbound_dns.html) to pre-configure this unbound.conf.

To install, pull the repository. Run
docker-compose build unbound
docker-compose up -d unbound

Test with `dig @[host-IP] com. SOA +dnssec` as described at the end of this [HowTo](https://www.unbound.net/documentation/howto_anchor.html)
