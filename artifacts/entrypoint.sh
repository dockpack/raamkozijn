#!/bin/bash
VM=`ls packer*.ovf|cut -d'.' -f1`

/sbin/rcvboxdrv setup
ln -s /usr/bin/dracut /usr/sbin/dracut
VBoxManage import packer*.ovf
VBoxManage modifyvm $VM --cpus 1
VBoxManage modifyvm $VM --nestedpaging off
VBoxManage modifyvm $VM --pae off
VBoxManage modifyvm $VM --vtxux off
VBoxManage modifyvm $VM --vtxvpid off
VBoxManage modifyvm $VM --hwvirtex off
VBoxManage modifyvm $VM --longmode off
VBoxManage setproperty hwvirtexclusive off
VBoxManage startvm --type gui $VM
tail -F /var/log/vbox-install.log
