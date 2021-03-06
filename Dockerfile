FROM ghcr.io/mwinters-stuff/docker-deluge:latest

RUN apk update && \
    apk add \
    bash \
    ca-certificates \
    curl \
    iptables \
    jq \
    git \
    openssl \
    wireguard-tools \
    iproute2 \
    ncurses \
    net-tools && \
    rm -rf \
      /tmp/* \
      /var/tmp/*

WORKDIR /
#COPY manual-connections/* /manual-connections/ 
RUN git clone --depth=1 https://github.com/pia-foss/manual-connections.git
ADD patch.sh .
RUN ./patch.sh
WORKDIR /manual-connections
COPY root/ /

