# Raamkozijn
Running Windows inside a Docker container for test automation purposes. VirtualBox/qemu, vagrant, packer, ansible et al.

## Creating the Windows base image with Packer
A Windows 7 Enterprise SP1 x86 ISO needs to be used and needs to be available at ./packer-windows/iso/. For example "en_windows_7_enterprise_with_sp1_x86_dvd_u_677710.iso".

```
$ make packer-build-vbox (VirtualBox builder. Outputs a Vagrant box)
$ make packer-build-vbox-vtx (accelerated with VT-x)
$ make packer-build-qemu (Qemu builder)
```

The contents of the image can be modified using the Autounattend.xml file at ./packer-windows/answer_files/7/Autounattend.xml.
The resulting Vagrant box can in turn be found at ./packer-windows/windows_7_virtualbox.box after Packer has finished.

**Windows Updates are disabled by default**

## Using Vagrant and Ansible to provision the base OS

```
$ vagrant up
```
