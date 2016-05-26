AUTHOR=ing-bank
NAME=raamkozijn
VERSION=latest

docker:
	docker build -t $(AUTHOR)/$(NAME):$(VERSION) .

winxp:
	docker run -d -m 1g -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} -v $(PWD)/vm:/vm -P $(AUTHOR)/$(NAME):$(VERSION) -m 512 -net user -smp 2 -drive file=/vm/winxp.img

packer-build-vbox:
	cd ./packer-windows; packer build -debug -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_vbox.json

packer-build-qemu:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_qemu.json	

default: packer-build-vbox
