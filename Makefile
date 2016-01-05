all: clean virtualenv uwsgi

clean:
	@find . -name *.pyc -delete

virtualenv:
	virtualenv venv
	venv/bin/pip install -r requirements.txt

uwsgi:
	venv/bin/uwsgi --wsgi-file foo/wsgi.py --http :8000 --master --processes 4 --threads 2 --chdir foo