AUTHOR=ing-bank
NAME=raamkozijn
VERSION=latest
PACKER_LOG=1

.PHONY: docker win7


packer-build-vbox:
	rm -rf ./packer-windows/output-virtualbox-iso/*
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_vbox.json

packer-build-vbox-vtx:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_vbox_vtx.json

packer-build-qemu:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_qemu.json

win7:
	cd ./packer-windows; PACKER_LOG=1 packer build --force -var-file win7vars.json win7.json

clean:
	cd ./packer-windows; rm -rf ./output-virtualbox-iso; rm -rf ./output-qemu; rm -rf ./*.box


docker:
	cp ./packer-windows/output-virtualbox-iso/* ./artifacts/
	docker build --no-cache=false  --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} -t $(AUTHOR)/$(NAME):$(VERSION) .

bash:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/share/virtualbox/src/:/usr/share/virtualbox/src/ -v /usr/src/:/usr/src/ -v /lib/modules:/lib/modules -P $(AUTHOR)/$(NAME):$(VERSION) /bin/bash
	#docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/src/:/usr/src/ -v /dev/vboxdrv:/dev/vboxdrv -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock $(AUTHOR)/$(NAME):$(VERSION) /bin/bash

magic:
	docker run --privileged=true -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v /usr/share/virtualbox/src/:/usr/share/virtualbox/src/ -v /usr/src/:/usr/src/ -v /lib/modules:/lib/modules -P $(AUTHOR)/$(NAME):$(VERSION)

default: packer-build-vbox
