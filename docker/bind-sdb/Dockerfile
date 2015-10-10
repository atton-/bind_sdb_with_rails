FROM centos

RUN /bin/yum -y install postgresql-devel bind-sdb-chroot bind-utils vim && yum clean all

# Initialize bind-sdb
ADD named.conf /var/named/chroot_sdb/etc/
RUN cp -rf /etc/named /var/named/chroot_sdb/etc; cp -rf /var/named/* /var/named/chroot_sdb/var/named/; chown named: -R /var/named/chroot_sdb; dig . ns @198.41.0.4 +bufsize=1024 > /var/named/chroot_sdb/var/named/named.ca

EXPOSE 53 53/udp

ADD start.sh /root/
RUN chmod u+x /root/start.sh
CMD /root/start.sh
