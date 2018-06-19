#!/bin/bash
#================================
port1=$1
port2=$2
bridge1=$3
bridge2=$4


ip link add dev $port1 type veth peer name $port2
ovs-vsctl add-port $bridge1 $port1
ovs-vsctl add-port $bridge2 $port2

ovs-vsctl set interface $port1 type=patch
ovs-vsctl set interface $port2 type=patch

ovs-vsctl set interface $port1 options:peer=$port2
ovs-vsctl set interface $port2 options:peer=$port1

# test: 
#  ip netns exec ns2 ping 10.0.0.1

