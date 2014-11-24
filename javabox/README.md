# Javabox

A Microcontainer for a Java based application. The version of the JRE is decided
by the volume container that has the files.

As this container is based on sirile/basebox it comes with the Consul integration
built-in and so (basically) requires a linked container running Consul server.
The start command for runit can be replaced with something that doesn't start
the consul agent if that isn't needed.

## Usage

The contianer requires basefilebox and javafilebox volume containers to run.

A Java environment can be spun up with:

```
sudo weave launch
sudo weave run 10.0.1.1/22 -p 8500:8500 -h consul -e DC=west --name consul --volumes-from basefilebox sirile/consulbox
sudo weave run 10.0.1.2/22 --volumes-from basefilebox --volumes-from java8filebox -e DC=west --link consul:consul -h javabox --name javabox --dns 127.0.0.1 sirile/javabox
```

Functionality can then be tested with:

```
docker exec -ti javabox /bin/sh
java -version
```
