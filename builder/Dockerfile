FROM fedora:23
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN dnf -y update
RUN dnf -y install unzip wget qemu qemu-img qemu-kvm ca-certificates
RUN dnf clean all
ENV PACKER_VERSION=0.10.1
ENV PACKER_SHA256SUM=eadd33bc0f8fa42034059fc1cda5f43ed6f540746e767480f0706ebed49b45e5
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./
RUN sed -i '/packer_${PACKER_VERSION}_linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
#RUN /usr/bin/sha256sum -c --strict packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip
RUN chmod +x /bin/packer
VOLUME /opt
ENTRYPOINT ["/bin/packer"]
