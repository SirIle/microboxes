# Nodejsbox

A Microcontainer that can be used to run nodejs applications.

As this container is based on sirile/basebox it comes with the Consul integration
built-in and so (basically) requires a linked container running Consul server.
The start command for runit can be replaced with something that doesn't start
the consul agent if that isn't needed.

## Usage

Requires two filebox volume containers to work:
 - sirile/basefilebox
 - sirile/nodejsfilebox

A nodejs environment can be started with:

```
sudo weave launch
sudo weave run 10.0.1.1/22 -p 8500:8500 -h consul -e DC=west --name consul --volumes-from basefilebox sirile/consulbox
sudo weave run 10.0.1.2/22 --volumes-from basefilebox --volumes-from nodejsfilebox -e DC=west --link consul:consul -h nodejsbox --name nodejsbox --dns 127.0.0.1 sirile/nodejsbox
```

Functionality can then be tested with:

```
docker exec -ti nodejsbox /bin/sh
node -v
```
