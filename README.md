# libmesh-git-docker
Docker image for libmesh git master for development and production.
Inspired by [docker-sshd](https://github.com/sullof/docker-sshd) and [docker-openblas](https://github.com/ogrisel/docker-openblas)

## Installation

```bash
$ git clone https://github.com/canesin/libmesh-git-docker
$ cd libmesh-git-docker
```

The container is accessed by ssh. Before using substitute the current
```authorized_keys``` file with your public key.

## Usage

Build the container:
```bash
$ sudo docker build -t canesin/libmesh-git-docker .
$ CONTAINER_ID=$(sudo docker run -d docker-ssh)
$ sudo docker inspect $CONTAINER_ID | grep IPAddress | awk '{ print $2 }' | tr -d ',"'
```

You will see the container internal IP address:
```
172.17.0.74
```
Finally, connect to the container with
```bash
$ ssh root@172.17.0.74
```

## License

The MIT License (MIT)

Copyright (c) 2015 Fábio César Canesin <fabio.canesin@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
