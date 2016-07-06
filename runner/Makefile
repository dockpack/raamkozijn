AUTHOR=raamkozijn
NAME=magic
VERSION=latest

build:
	docker build --no-cache=false -t $(AUTHOR)/$(NAME):$(VERSION) .

bash:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /dev/vboxdrv:/dev/vboxdrv -v /home/eh20ys/vdi:/vbox -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock $(AUTHOR)/$(NAME):$(VERSION) /bin/bash

new:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/src/kernels:/usr/src/kernels/ -v /lib/modules:/lib/modules -v /dev/vboxdrv:/dev/vboxdrv -v /home/eh20ys/vdi:/vbox $(AUTHOR)/$(NAME):$(VERSION) /bin/bash

run:
	docker run --privileged=true -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /dev/vboxdrv:/dev/vboxdrv -v /home/eh20ys/vdi:/vdi -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -P $(AUTHOR)/$(NAME):$(VERSION)

magic:
	docker run --privileged=true -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /home/eh20ys/vdi:/vdi -v /usr/src/kernels:/usr/src/kernels/ -v /lib/modules:/lib/modules -P $(AUTHOR)/$(NAME):$(VERSION)
	#docker run --privileged=true -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /dev/vboxdrv:/dev/vboxdrv -v /home/eh20ys/vdi:/vdi -v /usr/src/kernels:/usr/src/kernels/ -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -P $(AUTHOR)/$(NAME):$(VERSION)
