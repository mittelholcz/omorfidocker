SHELL=/bin/bash
all:
	@[[ "$(CMD)" ]] \
	&& docker run --name omorfi --rm -i omorfi:latest $(CMD) \
	|| echo -n ''
.PHONY: all


build:
	docker build -t omorfi:latest .
.PHONY: build


run:
	docker run --name omorfi --rm -it -v $$(pwd)/:/app/ omorfi:latest /bin/bash
.PHONY: run
