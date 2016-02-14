project=$(shell basename $(CURDIR))

buildall:
	$(MAKE) version=1.0.0 build
	$(MAKE) version=1.0.1 build
	$(MAKE) version=1.0.2 build
	$(MAKE) version=1.0.3 build
	$(MAKE) version=1.0.4 build
	docker tag $(project):1.0.4 $(project):1.0
	$(MAKE) version=1.1.0 build
	$(MAKE) version=1.1.1 build
	$(MAKE) version=1.1.2 build
	docker tag $(project):1.1.2 $(project):1.1
	$(MAKE) version=1.2.0 build
	$(MAKE) version=1.2.1 build
	docker tag $(project):1.2.1 $(project):1.2
	docker tag $(project):1.2.1 $(project):1

build:
	docker build --build-arg version=$(version) -t $(project):$(version) .
