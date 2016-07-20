#!/bin/bash
VM=raamkozijn

/sbin/rcvboxdrv setup
VBoxManage createvm --name $VM --ostype "Windows7" --register
VBoxManage storagectl $VM --name "IDE" --add ide  --bootable on --controller PIIX4
#VBoxManage storagectl $VM --name "SATA Controller" --add sata  --bootable on
#VBoxManage storageattach $VM --storagectl "SATA Controller" --port 0 --device 0
VBoxManage natnetwork add --netname NATnetwork --network 10.0.3.0/24 --dhcp on
VBoxManage modifyvm $VM --memory 2048 --vram 32 --cpus 1
VBoxManage modifyvm $VM --nat-network1 NATnetwork
VBoxManage modifyvm $VM --nic1 natnetwork
VBoxManage modifyvm $VM --nictype1 82540EM
VBoxManage modifyvm $VM --natnet1 NATnetwork
VBoxManage modifyvm $VM --audio none
VBoxManage modifyvm $VM --ioapic on
#vboxmanage hostonlyif create
#vboxmanage hostonlyif ipconfig "vboxnet0" --dhcp 
#VBoxManage storageattach $VM --storagectl "SATA Controller" --type hdd --port 0 --medium /$VM.vmdk
VBoxManage storageattach $VM --storagectl "IDE" --port 0 --device 0 --type hdd --medium /$VM.vmdk
VBoxManage startvm --type gui $VM
tail -F /var/log/vbox-install.log
