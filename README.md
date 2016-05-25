# windowframe
Running Windows inside a Docker container for test automation purposes. VirtualBox/qemu, vagrant, packer, ansible et al.

## Creating the Windows base image with Packer
A Windows 7 Enterprise SP1 ISO needs to be used and needs to be available at ./packer-windows/iso/. For example "en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso".

```
$ make packer-build-vbox
$ make packer-build-qemu
```

The contents of the image can be modified using the Autounattend.xml file at ./packer-windows/answer_files/7/Autounattend.xml.
The resulting Vagrant box can in turn be found at ./packer-windows/windows_7_virtualbox.box after Packer has finished.

**Windows Updates are disabled by default**
