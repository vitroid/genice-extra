PKGNAME=genice-extra
all:
	echo Hello.
.DELETE_ON_ERROR:
GENICE=genice2
BASE=genice2_extra
PACKAGE=genice2-extra

test:
	# cd ../genice-rdf     && make test
	cd ../genice-svg     && make test
	cd ../genice-cif     && make test
	cd ../genice-cage    && make test
	# cd ../genice-twist   && make test
	cd ../genice-mdanalysis && make test

check:
	python ./setup.py check
install:
	python ./setup.py install

test-deploy: build
	-pip install twine
	twine upload -r pypitest dist/*
test-install:
	pip install pillow
	pip install --index-url https://test.pypi.org/simple/ $(PACKAGE)



install:
	python ./setup.py install
uninstall:
	-pip uninstall -y $(PACKAGE)
build: README.md # $(wildcard $(BASE)/lattices/*.py) $(wildcard $(BASE)/*.py)
	python ./setup.py sdist bdist_wheel



deploy: build
	twine upload dist/*

clean:
	#cd ../genice-rdf     && make clean
	cd ../genice-svg     && make clean
	cd ../genice-cif     && make clean
	cd ../genice-cage    && make clean
	#cd ../genice-twist   && make clean
	cd ../genice-mdanalysis && make clean
	-rm $(ALL) *~ */*~
	-rm -rf build dist *.egg-info
	-find . -name __pycache__ | xargs rm -rf
