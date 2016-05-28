FROM fedora:23
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN dnf -y update
RUN dnf -y install unzip
RUN dnf clean all
RUN mkdir -p /root/bin
RUN curl -s https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip -o "/root/bin/packer.zip"
RUN unzip /root/bin/packer.zip -d /root/bin/
RUN rm /root/bin/packer.zip
RUN chmod +x /root/bin/packer
VOLUME /vm
ENTRYPOINT ["/root/bin/packer"]
