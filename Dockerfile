FROM ghcr.io/mwinters-stuff/docker-deluge:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    iptables \
    jq \
    git \
    openssl \
    wireguard-tools \
    iproute2 \
    net-tools \
    ncurses-bin && \
    rm -rf \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/*

WORKDIR /
#COPY manual-connections/* /manual-connections/ 
RUN git clone --depth=1 https://github.com/pia-foss/manual-connections.git
WORKDIR /manual-connections
COPY root/ /

