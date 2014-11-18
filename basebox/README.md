# Basebox

A base Microcontainer built on top of progrium/busybox. Not that useful by itself,
but acts as a base for running other applications.

## Contents

Includes symbolic links for:
 - consul
 - runsv & runsvdir (runit)

 Also includes basic configuration for runit, basic consul configuration including 
 DNS server port specification for the normal port 53.

 Fires up runit which starts the execution of consul and also other runit controlled
 processes that can be found from /etc/service.

## Requirements

Requires a volume container created from sirile/basefilebox to function.

Volume container can be created with:

```
docker run --name=basefilebox sirile/basefilebox
```

## Usage

As the consul tries to contact a server running on (a linked container) "consul", it
makes sense to first start the consul-container before starting something running
on top of basebox.

Starting the consul box and a shell on basebox can be done with:

```
docker run -p 8500:8500 -h consul -d --name consul --volumes-from basefilebox sirile/consulbox
docker run --volumes-from basefilebox --link consul:consul -h testbox --name testbox --dns 127.0.0.1 -ti sirile/basebox /bin/sh
```

From the shell you can check that Consul DNS service discovery is working with:

```
ping consul.service.consul
```

The Consul UI can be reached from the host from port 8500.

## Using with Weave

If the container is passed an environment variable called "DC", it waits for the Weave
provided interface "ethwe" to be available and advertises that to the Consul as the IP
address of the container. If the environment variable isn't specified, the IP received
from the system (same that is returned with `hostname -i`) is used.

Example of starting the containers with Weave:

```
sudo weave launch
sudo weave run 10.0.1.1/22 -p 8500:8500 -h consul -e DC=west --name consul --volumes-from basefilebox sirile/consulbox
sudo weave run 10.0.1.2/22 --volumes-from basefilebox -e DC=west --link consul:consul -h testbox --name testbox --dns 127.0.0.1 sirile/nodeboxtest
docker exec -ti testbox /bin/sh
ping consul.service.consul
```

The docker exec is needed because weave automatically runs the container in the background.
