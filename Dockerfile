FROM python:3.10-slim as build

RUN \
    set -ex && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/octodns

COPY requirements.txt requirements.txt

RUN \
    set -ex  &&\
    python -m venv env && \
    . env/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

RUN \
    pip install -e git+https://github.com/ganawaj/octodns-custom-provider.git#egg=octodns-custom-providers

ENV PATH=/opt/octodns/env/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD [ "/bin/sh" ]