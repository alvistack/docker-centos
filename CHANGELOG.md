# Docker Image Packaging for CentOS

## 7.6.1810-0alvistackx - TBC

### Major Changes

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
