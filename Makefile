test:
	pytest -v

clear_cache:
	rm -rf .pytest_cache
	find . -type d -name "__pycache__" -exec rm -r {} \;

build:
	make clear_cache
	docker build -t kytobase .
	docker run -d -p 5432:5432 --name kytobase kytobase
