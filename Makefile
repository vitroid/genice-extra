all:
	echo Hello.
.DELETE_ON_ERROR:
GENICE=genice2
BASENAME=genice2_extra
PIPNAME=genice2-extra
GITNAME=genice-extra

test:
	# cd ../genice-rdf     && make test
	cd ../genice-svg     && make test
	cd ../genice-cif     && make test
	cd ../genice-cage    && make test
	# cd ../genice-twist   && make test
	cd ../genice-mdanalysis && make test

%: temp_% replacer.py $(wildcard $(BASENAME)/lattices/*.py) $(wildcard $(BASENAME)/*.py)
	python replacer.py $< > $@


test-deploy: clean
	poetry publish --build -r testpypi
test-install:
	pip install --index-url https://test.pypi.org/simple/ $(PIPNAME)
uninstall:
	-pip uninstall -y $(PIPNAME)
build: README.md $(wildcard genice2_yaplot/*.py)
	poetry build
deploy: clean
	poetry publish --build
check:
	poetry check


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
