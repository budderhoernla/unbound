#!/bin/bash

# check if unbound_control.pem exists, if not run unbound-control-setup

if [ ! -f /etc/unbound_control.pem ]; then
	unbound-control-setup -d /etc/unbound/
fi

# check if /etc/unbound/rootkey directory exists, correct ownership if necessary
if [ -d /etc/unbound/rootkey ]; then
	RKUSER=$(stat -c '%U' /etc/unbound/rootkey)
	if [ "$RKUSER" != "unbound" ]; then
		chown -R unbound:unbound /etc/unbound/rootkey
	fi
# else create trust anchor
else
	mkdir /etc/unbound/rootkey
	chown -R unbound:unbound /etc/unbound/rootkey
	sudo -u unbound unbound-anchor -a "/etc/unbound/rootkey/root.key"
fi

# check if root.hints exists, if not download it
if [ ! -f /etc/unbound/root.hints ]; then
	wget ftp://FTP.INTERNIC.NET/domain/named.cache -O /etc/unbound/root.hints
fi

# exec unbound and exit bash script
exec /usr/sbin/unbound -d -c /etc/unbound/unbound.conf
