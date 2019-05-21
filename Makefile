.PHONY: all clean virtualenv uwsgi
	
BRANCH=$(shell git branch | grep '*' | awk '{print $$2}')

all: clean virtualenv uwsgi test

clean:
	@find . -name *.pyc -delete

virtualenv:
	python3.6 -m venv venv
	venv/bin/pip install -r requirements.txt

log:
	mkdir -p log

uwsgi: log
	venv/bin/uwsgi --ini uwsgi/emperor.ini

docker-build:
	docker build -t dm_$(BRANCH) .

docker-run:
	docker run --rm --name dm_$(BRANCH) -ti dm_$(BRANCH) make

docker-test:
	docker exec -ti dm_$(BRANCH) make test

test:
	ab -c 4 -n 20000 http://127.0.0.1:8000/
