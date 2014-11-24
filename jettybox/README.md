# Jettybox

A Microcontainer that can be used as the basebox for Jetty applications.
Doesn't practically do anything as no linking is required for the Jetty
runtime. Uses sirile/javabox (which is based on sirile/basebox) as the
base which means that it provides Consul.

Example of using this for a real application can be found from the project
sirile/jettytestbox.

## Usage

The Jetty can be started with:

```
java -jar /opt/files/jetty/jetty/start.jar
```

This reads the initialization files from the current folder and starts Jetty.

To be usable, the Jettybox requires three volume container Fileboxes:
 - sirile/basefilebox
 - sirile/java8filbox
 - sirile/jettyfilebox

The used JRE version can be controlled with changing which Java filebox is used.

Example startup command for the container that has an actual application set up:

```
docker run --volumes-from basefilebox -d --volumes-from java8filebox --volumes-from jettyfilebox --link consul:consul -h jettybox --name jettybox --dns 127.0.0.1 -p 80:80 sirile/jettytestbox
```

This exposes the defined port 80 to the host.
