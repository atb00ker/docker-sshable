# docker-sshable

[![Build Status](https://travis-ci.org/atb00ker/docker-sshable.svg?branch=master)](https://travis-ci.org/atb00ker/docker-sshable)
[![Docker Hub](https://img.shields.io/badge/docker--hub-atb00ker/sshable-brightgreen.svg)](https://hub.docker.com/r/atb00ker/sshable)
[![GitHub](https://img.shields.io/badge/github-docker--sshable-brightgreen.svg)](https://github.com/atb00ker/docker-sshable)

Official images with `openssh-server` and `python3` installed and configured. General purpose sshable container with python3 installed.
Containers maintained for working with ansible in mind.

IMPORTANT:
- Ports `22/tcp, 80/tcp, 443/tcp` exposed in all containers.
- `debian8` & `centos6` contains `python2` not `python3`.

## Image tags

- Debian: `debian10`, `debian9`, `debian8`
- Fedora: `fedora26`, `fedora27`, `fedora28`
- Ubuntu: `ubuntu14`, `ubuntu16`, `ubuntu18`
- CentOS: `centos6`, `centos7`

## Usage

```console
$ docker network create --driver bridge --subnet <network_address> --gateway <gateway_address> docker-bridge
$ docker run -dit --net docker-bridge --ip=<ip_address> atb00ker/sshable:debian10
$ ssh root@<ip_address>
```
Example values:
```
<network_address>: 192.168.56.33/27
<gateway>: 192.168.56.33
<ipadress>: 192.168.56.35
```

## Login information

- user: root
- password: root

Feel free to open an issue and talk about the repository.
Thanks to [Akihiro Uchida](https://github.com/uchida) for [docker-ubuntu-sshd](https://github.com/uchida/docker-ubuntu-sshd).
