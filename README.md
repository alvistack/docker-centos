Docker Image Packaging for CentOS
=================================

[![Travis](https://img.shields.io/travis/alvistack/docker-centos.svg)](https://travis-ci.org/alvistack/docker-centos)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-centos.svg)](https://github.com/alvistack/docker-centos/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-centos.svg)](https://github.com/alvistack/docker-centos/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/centos.svg)](https://hub.docker.com/r/alvistack/centos/)

CentOS Linux is a community-supported distribution derived from sources freely provided to the public by Red Hat for Red Hat Enterprise Linux (RHEL).

Learn more about CentOS: <https://www.centos.org/>

Supported Tags and Respective `Dockerfile` Links
------------------------------------------------

-   [`latest` (master/Dockerfile)](https://github.com/alvistack/docker-centos/blob/master/Dockerfile)
-   [`7` (7/Dockerfile)](https://github.com/alvistack/docker-centos/blob/7/Dockerfile)
-   [`6` (6/Dockerfile)](https://github.com/alvistack/docker-centos/blob/6/Dockerfile)

Overview
--------

This Docker container makes it easy to get an instance of SSHD up and running with CentOS.

Based on [Official CentOS Docker Image](https://hub.docker.com/_/centos/) with some minor hack:

-   Handle `ENTRYPOINT` with [dumb-init](https://github.com/Yelp/dumb-init)
-   Handle `CMD` with SSHD
-   Self initialize with Ansible, by dogfooding with Ansible Playbook

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

Versioning
----------

The `latest` tag matches the most recent version of this repository. Thus using `alvistack/centos:latest` or `alvistack/centos` will ensure you are running the most up to date version of this image.

License
-------

-   Code released under [Apache License 2.0](LICENSE)
-   Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

Author Information
------------------

-   Wong Hoi Sing Edison
    -   <https://twitter.com/hswong3i>
    -   <https://github.com/hswong3i>

