# Docker Image Packaging for CentOS

[![Gitlab pipeline status](https://img.shields.io/gitlab/pipeline/alvistack/docker-centos/master)](https://gitlab.com/alvistack/docker-centos/-/pipelines)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-centos.svg)](https://github.com/alvistack/docker-centos/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-centos.svg)](https://github.com/alvistack/docker-centos/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/centos.svg)](https://hub.docker.com/r/alvistack/centos/)

CentOS Linux is a community-supported distribution derived from sources freely provided to the public by Red Hat for Red Hat Enterprise Linux (RHEL).

Learn more about CentOS: <https://www.centos.org/>

## Supported Tags and Respective Packer Template Links

  - [`8`, `latest`](https://github.com/alvistack/docker-centos/blob/master/packer/docker-8/packer.json)
  - [`7`](https://github.com/alvistack/docker-centos/blob/master/packer/docker-7/packer.json)

## Overview

This Docker container makes it easy to get an instance of SSHD up and running with CentOS.

Based on [Official CentOS Docker Image](https://hub.docker.com/_/centos/) with some minor hack:

  - Packaging by Packer Docker builder and Ansible provisioner in single layer
  - Handle `ENTRYPOINT` with [catatonit](https://github.com/openSUSE/catatonit)
  - Handle `CMD` with SSHD

### Quick Start

Start SSHD:

    # Pull latest image
    docker pull alvistack/centos
    
    # Run as detach
    docker run \
        -itd \
        --name centos \
        --publish 2222:22 \
        alvistack/centos

**Success**. SSHD is now available on port `2222`.

Because this container **DIDN'T** handle the generation of root password, so you should set it up manually with `pwgen` by:

    # Generate password with pwgen
    PASSWORD=$(docker exec -i centos pwgen -cnyB1); echo $PASSWORD
    
    # Inject the generated password
    echo "root:$PASSWORD" | docker exec -i centos chpasswd

Alternatively, you could inject your own SSH public key into container's authorized\_keys by:

    # Inject your own SSH public key
    (docker exec -i centos sh -c "cat >> /root/.ssh/authorized_keys") < ~/.ssh/id_rsa.pub

Now you could SSH to it as normal:

    ssh root@localhost -p 2222

## Versioning

### `alvistack/centos:latest`

The `latest` tag matches the most recent [GitHub Release](https://github.com/alvistack/docker-centos/releases) of this repository. Thus using `alvistack/centos:latest` or `alvistack/centos` will ensure you are running the most up to date stable version of this image.

### `alvistack/centos:<version>`

The version tags are rolling release rebuild by [Travis](https://travis-ci.com/alvistack/docker-centos) in weekly basis. Thus using these tags will ensure you are running the latest packages provided by the base image project.

## License

  - Code released under [Apache License 2.0](LICENSE)
  - Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

  - Wong Hoi Sing Edison
      - <https://twitter.com/hswong3i>
      - <https://github.com/hswong3i>
