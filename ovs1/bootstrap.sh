#!/usr/bin/env bash
yum -y update
yum -y install wget openssl-devel gcc make python-devel openssl-devel kernel-devel graphviz kernel-debug-devel autoconf automake rpm-build redhat-rpm-config libtool python-twisted-core python-zope-interface PyQt4 desktop-file-utils libcap-ng-devel groff checkpolicy selinux-policy-devel

adduser ovs

su - ovs << EOF
mkdir -p ~/rpmbuild/SOURCES

wget http://openvswitch.org/releases/openvswitch-2.5.4.tar.gz

cp openvswitch-2.5.4.tar.gz ~/rpmbuild/SOURCES/

tar xfz openvswitch-2.5.4.tar.gz
rpmbuild -bb --nocheck openvswitch-2.5.4/rhel/openvswitch-fedora.spec
EOF
yum localinstall /home/ovs/rpmbuild/RPMS/x86_64/openvswitch-2.5.4-1.el7.x86_64.rpm -y 

systemctl start openvswitch.service

systemctl is-active openvswitch




systemctl enable openvswitch
ovs-vsctl -V


sleep 20;
bash /vagrant/add-port.sh 1 br1
bash /vagrant/add-port.sh 2 br2

bash /vagrant/connect-br.sh vm1 vm2 br1 br2



