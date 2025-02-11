# Docker Image Packaging for CentOS

<a href="https://alvistack.com" title="AlviStack" target="_blank"><img src="/alvistack.svg" height="75" alt="AlviStack"></a>

[![GitLab pipeline
status](https://img.shields.io/gitlab/pipeline/alvistack/docker-centos/master)](https://gitlab.com/alvistack/docker-centos/-/pipelines)
[![GitHub
tag](https://img.shields.io/github/tag/alvistack/docker-centos.svg)](https://github.com/alvistack/docker-centos/tags)
[![GitHub
license](https://img.shields.io/github/license/alvistack/docker-centos.svg)](https://github.com/alvistack/docker-centos/blob/master/LICENSE)
[![Docker
Pulls](https://img.shields.io/docker/pulls/alvistack/centos-10-stream.svg)](https://hub.docker.com/r/alvistack/centos-10-stream)

CentOS (from Community Enterprise Operating System) was a Linux
distribution that provided a free, community-supported computing
platform functionally compatible with its upstream source, Red Hat
Enterprise Linux (RHEL). In January 2014, CentOS announced the official
joining with Red Hat while staying independent from RHEL, under a new
CentOS governing board.

Learn more about CentOS: <https://centos.org/>

## Supported Tags and Respective Packer Template Links

- [`alvistack/centos-10-stream`](https://hub.docker.com/r/alvistack/centos-10-stream)
  - [`packer/docker-10-stream/packer.json`](https://github.com/alvistack/docker-centos/blob/master/packer/docker-10-stream/packer.json)
- [`alvistack/centos-9-stream`](https://hub.docker.com/r/alvistack/centos-9-stream)
  - [`packer/docker-9-stream/packer.json`](https://github.com/alvistack/docker-centos/blob/master/packer/docker-9-stream/packer.json)
- [`alvistack/centos-8-stream`](https://hub.docker.com/r/alvistack/centos-8-stream)
  - [`packer/docker-8-stream/packer.json`](https://github.com/alvistack/docker-centos/blob/master/packer/docker-8-stream/packer.json)
- [`alvistack/centos-7`](https://hub.docker.com/r/alvistack/centos-7)
  - [`packer/docker-7/packer.json`](https://github.com/alvistack/docker-centos/blob/master/packer/docker-7/packer.json)

## Overview

This Docker container makes it easy to get an instance of SSHD up and
running with CentOS.

Based on [Official CentOS Docker
Image](https://hub.docker.com/_/centos/) with some minor hack:

- Packaging by Packer Docker builder and Ansible provisioner in single
  layer
- Handle `ENTRYPOINT` with
  [catatonit](https://github.com/openSUSE/catatonit)
- Handle `CMD` with SSHD

### Quick Start

Start SSHD:

    # Pull latest image
    docker pull alvistack/centos-10-stream

    # Run as detach
    docker run \
        -itd \
        --name centos \
        --publish 2222:22 \
        alvistack/centos-10-stream

**Success**. SSHD is now available on port `2222`.

Because this container **DIDN'T** handle the generation of root
password, so you should set it up manually with `pwgen` by:

    # Generate password with pwgen
    PASSWORD=$(docker exec -i centos pwgen -cnyB1); echo $PASSWORD

    # Inject the generated password
    echo "root:$PASSWORD" | docker exec -i centos chpasswd

Alternatively, you could inject your own SSH public key into container's
authorized_keys by:

    # Inject your own SSH public key
    (docker exec -i centos sh -c "cat >> /root/.ssh/authorized_keys") < ~/.ssh/id_rsa.pub

Now you could SSH to it as normal:

    ssh root@localhost -p 2222

## Versioning

### `YYYYMMDD.Y.Z`

Release tags could be find from [GitHub
Release](https://github.com/alvistack/docker-centos/tags) of this
repository. Thus using these tags will ensure you are running the most
up to date stable version of this image.

### `YYYYMMDD.0.0`

Version tags ended with `.0.0` are rolling release rebuild by [GitLab
pipeline](https://gitlab.com/alvistack/docker-centos/-/pipelines) in
weekly basis. Thus using these tags will ensure you are running the
latest packages provided by the base image project.

## License

- Code released under [Apache License 2.0](LICENSE)
- Docs released under [CC BY
  4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

- Wong Hoi Sing Edison
  - <https://twitter.com/hswong3i>
  - <https://github.com/hswong3i>
