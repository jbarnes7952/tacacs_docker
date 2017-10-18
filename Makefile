.PHONY: build run run-jupyter

PORT ?= 49

build: Dockerfile
	docker build -t tacacs .

run:
	docker run -d --name tacacs_svr --rm -p $(PORT):$(PORT) tacacs

stop:
	docker stop tacacs_svr
