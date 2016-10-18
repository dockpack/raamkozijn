#!/bin/bash
VM=`ls IE*.ova|cut -d'.' -f1`

yum -y install /VirtualBox-5.1-5.1.4_110228_el7-1.x86_64.rpm

/sbin/rcvboxdrv setup
#ln -s /usr/bin/dracut /usr/sbin/dracut
VBoxManage import IE11\ -\ Win7.ova
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
