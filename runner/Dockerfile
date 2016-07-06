FROM docker.io/fedora:23
MAINTAINER Maxim.Belooussov@ing.nl

# set the timezone to be Europe/Amsterdam
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
#RUN yum -y update
RUN yum clean all
RUN yum -y install libXext libX11 libXcursor libSM libICE libGL fontconfig libXinerama
RUN yum -y install qt \
                   tar \
                   gcc \
                   make \
                   curl \
                   dkms \
                   bzip2 \
                   patch \
                   procps \
                   vagrant \
                   libgomp \
                   binutils \
                   glibc-devel \
                   kernel-devel \
                   glibc-headers \
                   kernel-headers \
                   vagrant-libvirt \
                   openssh-clients \
                   libvirt-daemon-vbox --allowerasing
RUN curl -kls http://download.virtualbox.org/virtualbox/5.0.12/VirtualBox-5.0.12-104815-Linux_amd64.run -o /VirtualBox-5.0.12-104815-Linux_amd64.run
RUN chmod +x /VirtualBox-5.0.12-104815-Linux_amd64.run
RUN /VirtualBox-5.0.12-104815-Linux_amd64.run
RUN rm -f /VirtualBox-5.0.12-104815-Linux_amd64.run
RUN yum clean all
VOLUME /vdi
VOLUME /usr/src/kernels
ADD artifacts/entrypoint.sh /entrypoint.sh
EXPOSE 5555
CMD /entrypoint.sh
