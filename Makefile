IMAGE_NAME := "azukiapp/php"

# bins
DOCKER := $(shell which adocker || which docker)

all: build 

build:
	${DOCKER} build -t ${IMAGE_NAME}:latest   5.6
	${DOCKER} build -t ${IMAGE_NAME}:5.6      5.6

build-no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:latest   5.6
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:5.6      5.6

.PHONY: build build-no-cache all
