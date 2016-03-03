IMAGE_NAME := "azukiapp/php"

# bins
DOCKER := $(shell which adocker || which docker)

all: build test

build:
	${DOCKER} build -t ${IMAGE_NAME}:latest   5.6
	${DOCKER} build -t ${IMAGE_NAME}:5.6      5.6

build-no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:latest   5.6
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:5.6      5.6

test:
	# run bats of test to each version
	./test.sh 5.6

.PHONY: test build build-no-cache all
