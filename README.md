# BusyBox based Microcontainer baseboxes

This folder contains containers that have been built on BusyBox.
The idea is to keep the container size minimized while maintaining
the functionality, more along the thinking of MicroContainers and
MicroServices.

The large executables and runtime environments are enabled by using
container volume sharing. The Fileboxes containing the executables
are defined under sirile/fileboxes project.

## Usage

### Building and running

Building the fileboxes can be done with the included script:

```
./rebuildFileboxes.sh
```

This deletes existing filebox containers and corresponding images from the
local node and then downloads newest images and creates the volume containers.

Then you can build and run the actual boxes:

```
./buildBoxes.sh
```

The examples that use these boxes as the base can be found from sirile/microtestboxes
project. The instructions to get them running are also included in that project.
