AUTHOR=raamkozijn
NAME=magic
VERSION=latest

build:
	cp ../packer-windows/output-virtualbox-iso/packer-virtualbox-iso-1467970004*.vmdk ./artifacts/raamkozijn.vmdk
	docker build --no-cache=false -t $(AUTHOR)/$(NAME):$(VERSION) .

bash:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /dev/vboxdrv:/dev/vboxdrv -v /home/eh20ys/vdi:/vbox -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock $(AUTHOR)/$(NAME):$(VERSION) /bin/bash

magic:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/src/:/usr/src/ -v /lib/modules:/lib/modules -P $(AUTHOR)/$(NAME):$(VERSION)
