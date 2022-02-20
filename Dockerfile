ARG BUILD_FROM
FROM ghcr.io/home-assistant/amd64-base-python:3.9-alpine3.14

# setup base
#ARG \
#    CERTBOT_VERSION \
#    CERTBOT_DNS_DIRECTADMIN_VERSION \
#    CERTBOT_NETCUP_VERSION \
#    CERTBOT_NJALLA_VERSION \
#    CERTBOT_GANDI_VERSION \
#    CERTBOT_DNS_TRANSIP_VERSION \
#    CERTBOT_DNS_ALIYUN_VERSION

RUN \
    set -x \
    && apk add --no-cache --update \
        libffi \
        musl \
        openssl \
    && apk add --no-cache --virtual .build-dependencies \
        build-base \
        libffi-dev \
        musl-dev \
        openssl-dev \
        cargo \
    && pip3 install --no-cache-dir \
        certbot==1.23.0 \
        certbot-dns-cloudflare==1.23.0 \
        certbot-dns-cloudxns==1.23.0 \
        certbot-dns-digitalocean==1.23.0 \
        certbot-dns-directadmin==0.0.24 \
        certbot-dns-dnsimple==1.23.0 \
        certbot-dns-dnsmadeeasy==1.23.0 \
        certbot-dns-gehirn==1.23.0 \
        certbot-dns-google==1.23.0 \
        certbot-dns-linode==1.23.0 \
        certbot-dns-luadns==1.23.0 \
        certbot-dns-njalla==1.0.0 \
        certbot-dns-nsone==1.23.0 \
        certbot-dns-ovh==1.23.0 \
        certbot-dns-rfc2136==1.23.0 \
        certbot-dns-route53==1.23.0 \
        certbot-dns-sakuracloud==1.23.0 \
        certbot-dns-netcup==1.1.1 \
        certbot-plugin-gandi==1.3.2 \
        certbot-dns-transip==0.4.3 \
        certbot-dns-aliyun==0.38.1 \
    && apk del .build-dependencies

# Copy data
COPY rootfs /
