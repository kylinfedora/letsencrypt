#ARG BUILD_FROM
#FROM $BUILD_FROM
FROM homeassistant/amd64-base-python:3.7-alpine3.11

# setup base
#ARG CERTBOT_VERSION
#ARG CERTBOT_DNS_DIRECTADMIN_VERSION
#ARG CERTBOT_NETCUP_VERSION
#ARG CERTBOT_NJALLA_VERSION
#ARG CERTBOT_GANDI_VERSION
#ARG CERTBOT_DNS_TRANSIP_VERSION
#ARG CERTBOT_ALIYUN_VERSION

RUN apk add --no-cache --update \
        libffi \
        musl \
        openssl \
    && apk add --no-cache --virtual .build-dependencies \
        g++ \
        libffi-dev \
        musl-dev \
        openssl-dev \
    && pip3 install --no-cache-dir --find-links \
        "https://wheels.home-assistant.io/alpine-$(cut -d '.' -f 1-2 < /etc/alpine-release)/amd64/" \
        certbot==1.2.0 \
        certbot-dns-cloudflare==1.2.0 \
        certbot-dns-cloudxns==1.2.0 \
        certbot-dns-digitalocean==1.2.0 \
        certbot-dns-directadmin==0.0.13 \
        certbot-dns-dnsimple==1.2.0 \
        certbot-dns-dnsmadeeasy==1.2.0 \
        certbot-dns-gehirn==1.2.0 \
        certbot-dns-google==1.2.0 \
        certbot-dns-linode==1.2.0 \
        certbot-dns-luadns==1.2.0 \
        certbot-dns-njalla==0.0.4 \
        certbot-dns-nsone==1.2.0 \
        certbot-dns-ovh==1.2.0 \
        certbot-dns-rfc2136==1.2.0 \
        certbot-dns-route53==1.2.0 \
        certbot-dns-sakuracloud==1.2.0 \
        certbot-dns-netcup==0.31.0.1 \
        certbot-plugin-gandi==1.2.5 \
        certbot-dns-transip==0.3.0 \
        certbot-dns-aliyun==0.38.1 \
    && apk del .build-dependencies

# Copy data
COPY rootfs /
