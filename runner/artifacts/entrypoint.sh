#!/bin/bash

/sbin/rcvboxdrv setup
VBoxManage createvm --name raamkozijn --ostype "Windows7" --register
echo "added vm"
VBoxManage storagectl raamkozijn --name "IDE" --add ide  --bootable on --controller PIIX4
echo "added controller"
#VBoxManage storageattach raamkozijn --storagectl "IDE" --port 0 --device 0 --type hdd
#echo "added storage"
#VBoxManage storageattach raamkozijn --storagectl "SATA Controller" --port 0 --device 0
#VBoxManage natnetwork add --netname NATnetwork --network 10.0.3.0/24 --dhcp on
VBoxManage modifyvm raamkozijn --memory 2048 --vram 32 --cpus 1
VBoxManage modifyvm raamkozijn --nat-network1 NATnetwork
VBoxManage modifyvm raamkozijn --nic1 natnetwork
VBoxManage modifyvm raamkozijn --nictype1 82540EM
VBoxManage modifyvm raamkozijn --natnet1 NATnetwork
echo "added network"
VBoxManage modifyvm raamkozijn --audio none
#VBoxManage storageattach raamkozijn --storagectl "SATA Controller" --type hdd --port 0 --medium /vdi/raamkozijn.vmdk
#vboxmanage hostonlyif create
#vboxmanage hostonlyif ipconfig "vboxnet0" --dhcp 
#echo "added hostonlyif"
#VBoxManage import /vdi/raamkozijn.ova
VBoxManage storageattach raamkozijn --storagectl "IDE" --port 0 --device 0 --type hdd --medium /vdi/raamkozijn.vmdk
echo "added storage"
VBoxManage startvm --type gui raamkozijn
tail -F /var/log/messages
