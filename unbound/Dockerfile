FROM arm32v7/debian:stable-slim

MAINTAINER SF <none@none.none>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV TZ=Europe/Berlin

# Install dependencies
RUN apt-get update && apt-get upgrade -y --force-yes && apt-get install -y --force-yes --no-install-recommends apt-utils
RUN apt-get -y --force-yes install sudo wget unbound 

# Configure timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy init script
COPY ./core/init_run.sh /root/

EXPOSE 53
