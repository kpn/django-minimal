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

EXPOSE 8000

CMD make
