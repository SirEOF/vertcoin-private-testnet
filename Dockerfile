FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/vertcoin/vertcoin/releases/download/v0.11.1.0/vertcoin-v0.11.1.0-linux-64bit.zip \
    /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get -y update && apt-get install -y --no-install-recommends curl unzip && \
    cd /tmp && unzip *.zip && cp -r /tmp/* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16001 16002 16003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
