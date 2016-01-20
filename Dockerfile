FROM ubuntu:14.04.3

RUN apt-get update && apt-get -qy install \
    build-essential \
    nginx \
    python2.7 \
    virtualenvwrapper \
    python-dev \
    curl \
    apache2-utils

RUN mkdir /projects

ADD . /projects

WORKDIR /projects

RUN rm -rf venv && \
    virtualenv venv && \
    venv/bin/pip install -r requirements.txt

EXPOSE 8000

CMD make
