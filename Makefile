.PHONY: all clean virtualenv uwsgi

all: clean virtualenv uwsgi

clean:
	@find . -name *.pyc -delete

virtualenv:
	virtualenv venv
	venv/bin/pip install -r requirements.txt

log:
	mkdir -p log

uwsgi: log
	venv/bin/uwsgi --ini uwsgi/emperor.ini
