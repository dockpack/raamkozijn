FROM fedora:23
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN dnf -y install qemu qemu-img qemu-kvm ceph-common && \
    dnf clean all
VOLUME /vm
ENTRYPOINT ["qemu-system-x86_64"]
