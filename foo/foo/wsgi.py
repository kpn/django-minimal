"""
WSGI config for foo project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""

import os
import django
import time
import random

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "foo.settings")


def my_application(env, start_response):
    # time.sleep(random.uniform(0, 0.01))
    start_response('200 OK', [('Content-Type', 'text/html')])
    return [b"Hello World"]


def get_wsgi_application():
    django.setup()
    return my_application


application = get_wsgi_application()
