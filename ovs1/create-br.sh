#!/usr/bin/env bash

#===============================
ip link add dev vm1 type veth peer name vm2
#ip addr add 10.0.0.2/24 dev vm2


#ovs-vsctl add-br br0
#add int (make sure it is eth1)
#ovs-vsctl add-port br0 eth1
#ovs-vsctl add-port br0 vm1

