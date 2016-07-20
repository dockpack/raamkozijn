AUTHOR=raamkozijn
NAME=raamkozijn
VERSION=latest

build:
#	cp ~/VirtualBox\ VMs/raamkozijn.vmdk ./artifacts/raamkozijn.vmdk
	cp ../packer-windows/output-virtualbox-iso/packer-virtualbox-iso-1467970004*.vmdk ./artifacts/raamkozijn.vmdk
	docker build --no-cache=false  --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -t $(AUTHOR)/$(NAME):$(VERSION) .

bash:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/share/virtualbox/src/:/usr/share/virtualbox/src/ -v /usr/src/:/usr/src/ -v /lib/modules:/lib/modules -P $(AUTHOR)/$(NAME):$(VERSION) /bin/bash
	#docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/src/:/usr/src/ -v /dev/vboxdrv:/dev/vboxdrv -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock $(AUTHOR)/$(NAME):$(VERSION) /bin/bash

magic:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/share/virtualbox/src/:/usr/share/virtualbox/src/ -v /usr/src/:/usr/src/ -v /lib/modules:/lib/modules -P $(AUTHOR)/$(NAME):$(VERSION)
