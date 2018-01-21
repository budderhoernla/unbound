FROM arm32v7/debian:stable-slim

MAINTAINER Stefan Falge <mail@stefan-falge.de>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV TZ=Europe/Berlin

# Install dependencies
RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install unbound 

# Configure timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 53

CMD /usr/sbin/unbound -d -c /etc/unbound/unbound.conf 
