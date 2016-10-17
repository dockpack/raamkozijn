AUTHOR=alko
NAME=msraamkozijn
VERSION=latest

.PHONY: docker win7




docker:
	docker build --no-cache=false  -t $(AUTHOR)/$(NAME):$(VERSION) .

bash:
	docker run --privileged=true -ti -e DISPLAY=unix${DISPLAY} -P $(AUTHOR)/$(NAME):$(VERSION) /bin/bash

magic:
	docker run --privileged=true -ti -e DISPLAY=unix${DISPLAY} -P $(AUTHOR)/$(NAME):$(VERSION)

default: magic
