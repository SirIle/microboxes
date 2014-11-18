#!/bin/sh
if [ -z $DC ]
then
  exec /opt/files/consul agent -server -bootstrap-expect=1 -client 0.0.0.0 -data-dir /tmp/consul -ui-dir /opt/consul_ui
else
  # Wait for the network to be ready
  while ! grep -q ^1$ /sys/class/net/ethwe/carrier 2>/dev/null
    do sleep 1
  done
  IP=`ip -4 -o addr show dev ethwe 2> /dev/null |awk '{split($4,a,"/") ;print a[1]}'`
  exec /opt/files/consul agent -server -advertise $IP -bootstrap-expect=1 -client 0.0.0.0 -data-dir /tmp/consul -dc $DC -ui-dir /opt/consul_ui
fi
