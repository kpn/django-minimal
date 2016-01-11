FROM ubuntu:14.04.3

RUN apt-get update && apt-get -qy install \
    build-essential \
    nginx \
    python2.7 \
    virtualenvwrapper \
    curl \
    apache2-utils

RUN mkdir /projects

ADD . /projects

WORKDIR /projects

CMD make
