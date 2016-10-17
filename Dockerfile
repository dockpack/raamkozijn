FROM docker.io/centos:latest
MAINTAINER Maxim.Belooussov@ing.nl

# set the timezone to be Europe/Amsterdam
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
#RUN yum -y update
RUN yum clean all
RUN yum -y install libXext libX11 libXcursor libSM libICE libGL fontconfig libXinerama
RUN yum -y groupinstall fonts
RUN yum -y install qt \
                   tar \
                   gcc \
                   make \
                   curl \
                   dkms \
                   bzip2 \
                   patch \
                   which \
                   python \
                   procps \
                   vagrant \
                   libgomp \
                   systemd \
                   binutils \
                   glibc-devel \
                   kernel-devel \
                   glibc-headers \
                   kernel-headers \
                   vagrant-libvirt \
                   openssh-clients \
                   libvirt-daemon-vbox
RUN yum -y install dbus \
                   SDL \
                   alsa-lib \
                   libXmu \
                   libXt \
                   libpng \
                   libvpx \
                   net-tools
RUN curl -kls http://download.virtualbox.org/virtualbox/5.1.4/VirtualBox-5.1-5.1.4_110228_el7-1.x86_64.rpm -o /VirtualBox-5.1-5.1.4_110228_el7-1.x86_64.rpm
RUN yum clean all
VOLUME /usr/src/
COPY artifacts/IE*.* /
COPY artifacts/entrypoint.sh /entrypoint.sh
EXPOSE 5555 5985
CMD /entrypoint.sh
