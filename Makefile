VIRTUALENV="virtualenv"
virtualenv_dir="venv"

setup: venv deps

serve: venv
	. $(virtualenv_dir)/bin/activate && dev_appserver.py src

test:
	. $(virtualenv_dir)/bin/activate && python src/apptest.py /usr/local/bin

venv:
	test -d venv || ($(VIRTUALENV) $(virtualenv_dir) || true)
	. $(virtualenv_dir)/bin/activate

deps:
	pip install -Ur requirements_dev.txt

keys:
	./src/application/generate_keys.py

