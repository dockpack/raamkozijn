#!/bin/bash

/sbin/rcvboxdrv setup
VBoxManage createvm --name raamkozijn --ostype "Windows7" --register
VBoxManage storagectl raamkozijn --name "IDE" --add ide  --bootable on --controller PIIX4
#VBoxManage storageattach raamkozijn --storagectl "SATA Controller" --port 0 --device 0
VBoxManage natnetwork add --netname NATnetwork --network 10.0.3.0/24 --dhcp on
VBoxManage modifyvm raamkozijn --memory 2048 --vram 32 --cpus 1
VBoxManage modifyvm raamkozijn --nat-network1 NATnetwork
VBoxManage modifyvm raamkozijn --nic1 natnetwork
VBoxManage modifyvm raamkozijn --nictype1 82540EM
VBoxManage modifyvm raamkozijn --natnet1 NATnetwork
VBoxManage modifyvm raamkozijn --audio none
VBoxManage modifyvm raamkozijn --ioapic on
#vboxmanage hostonlyif create
#vboxmanage hostonlyif ipconfig "vboxnet0" --dhcp 
#VBoxManage storageattach raamkozijn --storagectl "SATA Controller" --type hdd --port 0 --medium /vdi/raamkozijn.vmdk
VBoxManage storageattach raamkozijn --storagectl "IDE" --port 0 --device 0 --type hdd --medium /raamkozijn.vmdk
VBoxManage startvm --type gui raamkozijn
tail -F /var/log/vbox-install.log
