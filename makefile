# makefile shortcuts
.PHONY: develop install check clean remove docs readdocs test
NAME = ortho
develop:
	pip install -e '.[all]'
install:
	pip install '.[all]'
check:
	python -c 'import ${NAME}'
clean:
	rm -rf ./${NAME}.egg-info
	rm -rf build dist
	find . -name __pycache__ -type d -exec rm -rf {} \; || :
	find . -name "*.pyc" -type f -exec rm {} \; || :
remove:
	pip uninstall ${NAME} -y
docs:
	make -C docs html -b coverage
	cat docs/build/coverage/python.txt
readdocs:
	open docs/build/html/index.html
test:
	python -m unittest
