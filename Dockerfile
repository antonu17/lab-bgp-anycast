FROM debian:12 AS base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y --no-install-recommends install procps iproute2 iptables iputils-ping traceroute mtr tcpdump lsb-release ca-certificates nginx curl dnsutils sed vim

COPY ping_all.sh /

FROM base AS bird

RUN apt-get -y --no-install-recommends install bird2

FROM base AS frr

RUN curl -s https://deb.frrouting.org/frr/keys.gpg -o /usr/share/keyrings/frrouting.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/frrouting.gpg] https://deb.frrouting.org/frr $(lsb_release -s -c) frr-stable" > /etc/apt/sources.list.d/frr.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install frr frr-pythontools

RUN sed -i 's/^bgpd=no/bgpd=yes/' /etc/frr/daemons
