all:
	@echo 'Choose a target: build, run'
.PHONY: all


build:
	docker build -t omorfi:latest .
.PHONY: build


run:
	docker run --name omorfi --rm -it omorfi:latest /bin/bash
.PHONY: run

# TODO
# - volume
# - terminal okositas / szinezes
