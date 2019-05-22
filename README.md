Purpose
========

This repo checks the influence of [Appdynamics](https://www.appdynamics.com/)
monitoring on a minimal [Django](https://www.djangoproject.com/) Hello World
application running through
[UWSGI](https://uwsgi-docs.readthedocs.org/en/latest/)

Structure of this repo
=======================

This repository contains:

* An application called 'foo'. Its structure is that of a scafolded Django
  application. It consists of a `wsgi.py` file which responds 'Hello World' to
  all requests

* A `uwsgi` folder including a minimal setup for uwsgi to serve the Django app
  on local port 8000 using an emperor

* Two branches:
    * `master` with a vanilla wsgi setup
    * `appd` with an appdynamics uwsgi setup based on (no controller is needed)

* A Makefile for ease of operation

Requirements
============

With docker:

* docker 1.9.1+

Without:

* Python 3.6
* Apache Bench (ab)
* GNU Make
* A linux machine (UWSGI worker reloading is troublesome under OSX)

Usage
======

With Docker:

1. `docker build -t dm .`
2. `docker run --name dm_cont dm make` to run the uwsgi server
3. `docker exec -it dm_cont bash` and then, within the container, `make test`
4. Exit the container shell and kill the container with `docker rm -f dm_cont`

Without:

1. Run `make` to start the uwsgi server
2. On a different shell, run `make test` to start bombarding it with [Apache
   Bench](https://httpd.apache.org/docs/2.2/programs/ab.html). Note that the
   test finishes successfully.
3. Kill the server, switch to the `appd` branch and repeat the steps.
