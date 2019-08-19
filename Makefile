PKGNAME=genice-extra
all:
	echo Hello.
.DELETE_ON_ERROR:

test-deploy: build
	twine upload -r pypitest dist/*
test-install:
	pip install --index-url https://test.pypi.org/simple/ $(PKGNAME)

install: check
	./setup.py install
uninstall:
	pip uninstall $(PKGNAME)
build: README.md ./setup.py
	./setup.py sdist bdist_wheel

deploy: build
	twine upload dist/*
check:
	./setup.py check


clean:
	-rm $(ALL) *~ */*~
	-rm -rf build dist *.egg-info
	-find . -name __pycache__ | xargs rm -rf
