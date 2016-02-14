project=$(shell basename $(CURDIR))

buildall:
	# alphas
	$(MAKE) version=2.0.0-alpha build
	$(MAKE) version=2.0.1-alpha build
	$(MAKE) version=2.0.2-alpha build
	$(MAKE) version=2.0.3-alpha build
	$(MAKE) version=2.0.4-alpha build
	$(MAKE) version=2.0.5-alpha build
	$(MAKE) version=2.0.6-alpha build
	docker tag $(project):2.0.6-alpha $(project):2.0-alpha
	# betas
	$(MAKE) version=2.1.0-beta build
	$(MAKE) version=2.1.1-beta build
	docker tag $(project):2.1.1-beta $(project):2.1-beta
	# releases
	$(MAKE) version=2.2.0 build
	docker tag $(project):2.2.0 $(project):2.2
	$(MAKE) version=2.3.0 build
	docker tag $(project):2.3.0 $(project):2.3
	$(MAKE) version=2.4.0 build
	$(MAKE) version=2.4.1 build
	docker tag $(project):2.4.1 $(project):2.4
	$(MAKE) version=2.5.0 build
	$(MAKE) version=2.5.1 build
	$(MAKE) version=2.5.2 build
	docker tag $(project):2.5.2 $(project):2.5
	$(MAKE) version=2.6.0 build
	$(MAKE) version=2.6.1 build
	$(MAKE) version=2.6.2 build
	$(MAKE) version=2.6.3 build
	docker tag $(project):2.6.3 $(project):2.6
	$(MAKE) version=2.7.0 build
	$(MAKE) version=2.7.1 build
	$(MAKE) version=2.7.2 build
	docker tag $(project):2.7.2 $(project):2.7
	docker tag $(project):2.7.2 $(project):2

build:
	docker build --build-arg version=$(version) -t $(project):$(version) .
