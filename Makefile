
packer-build-vbox:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso -var iso_checksum=a491f985dccfb5863f31b728dddbedb2ff4df8d1 -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_vbox.json

packer-build-qemu:
	cd ./packer-windows; packer build -var iso_url=./iso/en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso -var iso_checksum=a491f985dccfb5863f31b728dddbedb2ff4df8d1 -var iso_checksum_type=sha1 -var autounattend=./answer_files/7/Autounattend.xml ./windows_7_qemu.json	

default: packer-build-vbox
