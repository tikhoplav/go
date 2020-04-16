<br>

<p align="center">
  <img src="https://www.docker.com/sites/default/files/d8/2019-07/Moby-logo.png" width="120" align="middle">
  &nbsp;&nbsp;&nbsp;
  <img src="https://d1q6f0aelx0por.cloudfront.net/product-logos/library-alpine-logo.png" width="100" align="middle">
  &nbsp;&nbsp;&nbsp;
  <img src="https://d1q6f0aelx0por.cloudfront.net/product-logos/library-golang-logo.png" width="100" align="middle">
  &nbsp;&nbsp;&nbsp;
  <img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" width="100" align="middle">
</p>

<br>

# Golang + Git Alpine based Docker Image

Do you want to use the official `golang:alpine` image and able to download dependencies out of the box?

This image uses [`golang:alpine`](https://hub.docker.com/_/golang) as a base image and adds `git` binary to it. Simple.

## Usage

```docker pull tikhoplav/go```

Or in the Dockerfile

```FROM tikhoplav/go```
