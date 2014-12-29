# Consulbox

A Microcontainer running on top of sirile/basebox which offers a consul server
and consul UI. It also contains a start script for the Consul server which
can adapt to Weave provided networking if the environment variable DC has been
set. Otherwise it uses the normal IP of the container.

## Usage

Running the Consul container requires the basefilebox volume container for the
Consul executable.

Example startup command using Weave for networking:
```
sudo weave launch
sudo weave run 10.0.1.1/22 -p 8500:8500 -h consul -e DC=west --name consul --volumes-from basefilebox sirile/consulbox
```

Example startup command without Weave:

```
docker run -p 8500:8500 -h consul -d --name consul --volumes-from basefilebox sirile/consulbox
```

Both of the commands expose the Consul UI in port 8500 of the host.
