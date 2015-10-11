# libmesh-git-docker
Docker image for libmesh git master.

It contains:
- Ubuntu LTS minimal container : latest
- GCC 4.8.x and GFortran 4.8.x
- OpenBLAS master : github (AVX2 and 64-threads, Provides BLAS CBLAS LAPACK LAPACKE).
- PETSc 3.6.x latest stable release
- LibMesh master : github

Inspired by [docker-openblas](https://github.com/ogrisel/docker-openblas)

## Usage

Build and start bash in the container:
```bash
$ docker build -t canesin/libmesh-git .
$ docker exec -it canesin/libmesh-git bash
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
