.PHONY: all clean virtualenv uwsgi test

all: clean virtualenv uwsgi

clean:
	@find . -name *.pyc -delete

virtualenv:
	virtualenv venv
	venv/bin/pip install -r requirements.txt

uwsgi:
	venv/bin/uwsgi --ini uwsgi/emperor.ini

test:
	ab -c 4 -n 20000 http://127.0.0.1:8000/
