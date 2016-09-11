# Docker-tftpd
FROM centos:latest

MAINTAINER Justin Luna

# Build container
# docker build -t 4a4c/tftpd .

# Start the container with the follonwing command:
# docker run -it --rm --net=host -v /home/core/bootstrap-local/tftp/tftpboot/:/tftpboot 4a4c/tftpd

RUN adduser tftpd
RUN mkdir /tftpboot
RUN chown tftpd:tftpd /tftpboot

RUN yum update -y
RUN yum install -y tftp-server
VOLUME /tftpboot

EXPOSE 69

CMD /usr/sbin/in.tftpd --foreground --user tftpd --address 0.0.0.0:69 --secure /tftpboot
