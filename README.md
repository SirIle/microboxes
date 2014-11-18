# TODO:

- Update this readme!
- Add decriptions under the box-folders (basebox is done)

# BusyBox based containers

This folder contains containers that have been built on BusyBox.
The idea is to keep the container size minimized while maintaining
the functionality, more along the thinking of MicroContainers and
MicroServices.

## Usage

### Building and running

First you need to build the filebox images and containers:

```
./rebuildFileboxes.sh
```

Then you can build and run the actual boxes:

```
./buildBoxes.sh
```

Running node example:

```
./startNodeboxTest.sh
```

Running Jetty example:

```
./startJettyboxTest.sh
```

Application can be accessed from the port 80. The normal address is http://10.10.10.30
for the node example and http://10.10.10.30/sample for the Jetty example.

### Accessing the container

The running container can be accessed with:

```
docker exec -it <containername> /bin/sh
```

### ConsulUI

The web UI for Consul is accessible at http://10.10.10.30:8500.
