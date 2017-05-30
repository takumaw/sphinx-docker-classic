DEV_DOCKER_IMAGE_NAME = sphinx-docker-sample
MOUNTS = -v "`pwd`":/usr/local/src/doc
ENVVARS = #--env-file .env
BUILDARGS = #$(shell cat .env | while read ln; do echo "--build-arg $$ln "; done)

build: html latexpdfja

# build docker image
.PHONY: build_docker_image
build_docker_image:
	docker build $(BUILDARGS) -t $(DEV_DOCKER_IMAGE_NAME) -f ./Dockerfile .

# build documents using a container
.PHONY: html dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf text man changes linkcheck doctest gettext
html dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf text man changes linkcheck doctest gettext: build_docker_image
	docker run --rm $(ENVVARS) $(MOUNTS) $(DEV_DOCKER_IMAGE_NAME) make $@

.PHONY: latexpdfja
latexpdfja: build_docker_image latex
	docker run --rm $(ENVVARS) $(MOUNTS) -w /usr/local/src/doc/build/latex $(DEV_DOCKER_IMAGE_NAME) make all-pdf-ja

# clean build artifacts using a container
.PHONY: clean
clean: build_docker_image
	docker run --rm $(ENVVARS) $(MOUNTS) $(DEV_DOCKER_IMAGE_NAME) make clean

# start container in interactive mode for inspection
.PHONY: dev
dev: build_docker_image
	docker run -it $(ENVVARS) $(MOUNTS) $(DEV_DOCKER_IMAGE_NAME) bash

shell: dev
