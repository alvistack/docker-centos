# Docker Image Packaging for CentOS

## 8.2.2004-XalvistackY - TBC

### Major Changes

  - Revamp with Packer

## 8.2.2004-4alvistack6 - 2020-10-14

### Major Changes

  - Refine Molecule matrix

## 8.2.2004-4alvistack1 - 2020-08-26

### Major Changes

  - Upgrade minimal Ansible Lint support to 4.3.2
  - Install SQLite, MariaDB and PostgreSQL with Role
  - Upgrade Travis CI test as Ubuntu Focal based
  - Upgrade minimal Ansible support to 2.10.0

## 8.1.1911-4alvistack2 - 2020-06-10

### Major Changes

  - Revamp `create`, `side_effect`, `verify` and `destroy` logic
  - Replace `tini` with `catatonit`
  - Rename `post_tasks.yml` as `side_effect.yml`
  - Add CentOS 8 support

## 7.7.1908-4alvistack4 - 2020-03-05

### Major Changes

  - Revamp with Molecule and `docker commit`
  - Consolidate molecule tests into `default` (noop)
  - Hotfix for systemd
  - Replace `duplicity` with `restic`

## 7.6.1810-3alvistack1 - 2020-01-15

### Major Changes

  - Replace `dumb-init` with `tini`, as like as `docker --init`
  - Replace `java` with `openjdk`
  - Replace `nodejs` with `node`
  - Include release specific vars and tasks

## 7.6.1810-2alvistack3 - 2019-11-05

### Major Changes

  - Upgrade minimal Ansible support to 2.9.0
  - Upgrade Travis CI test as Ubuntu Bionic based
  - Default with Python 3
  - Prepend executable if command starts with an option
  - Improve `ENTRYPOINT` and `CMD`

## 7.6.1810-0alvistack11 - 2019-05-20

### Major Changes

  - Bugfix "Build times out because no output was received"
  - Upgrade minimal Ansible support to 2.8.0

## 7.6.1810-0alvistack8 - 2019-04-15

### Major Changes

  - Remove CentOS 6 support
  - Porting to Molecule based
  - Add rclone support

## 7.5.1810-0alvistack1 - 2018-12-06

### Major Changes

  - Add CVS, SVN, GIT, Mercurial and Perforce support
  - Replace Oracle Java JDK with OpenJDK
  - Upgrade Node.js version

## 7.5.1804-0alvistack3 - 2018-11-20

### Major Changes

  - Deploy with roles in master branch
  - CI with ansible-lint
  - Add /root/.ssh/config
  - Set correct permission for /root/.ssh during bootup

## 7.5.1804-0alvistack2 - 2018-11-09

### Major Changes

  - Skip container re-bootstrap in background during bootup
  - Preinstall with PHP, Node.js and Java

## 7.5.1804-0alvistack1 - 2018-10-29

  - CentOS 6.10/7.5.1804 based
  - Handle ENTRYPOINT with dumb-init
  - Handle `CMD` with SSHD
  - Self initialize with Ansible, by dogfooding with Ansible Playbook
