AUTHOR=ing-bank
NAME=raamkozijn
VERSION=latest
PACKER_LOG=1

.PHONY: docker win7

docker:
	docker build -t $(AUTHOR)/$(NAME):$(VERSION) .

packer-build-vbox:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_vbox.json

packer-build-vbox-vtx:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_vbox_vtx.json

packer-build-qemu:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso -var iso_checksum=4e0450ac73ab6f9f755eb422990cd9c7a1f3509c -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_qemu.json

win7:
	cd ./packer-windows; PACKER_LOG=1 packer build --force -var-file win7vars.json win7.json

clean:
	cd ./packer-windows; rm -rf ./output-virtualbox-iso; rm -rf ./output-qemu; rm -rf ./*.box

default: packer-build-vbox
