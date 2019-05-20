# (c) Wong Hoi Sing Edison <hswong3i@pantarei-design.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM centos:7

ENV LANG   "en_US.UTF8"
ENV LC_ALL "en_US.UTF8"
ENV SHELL  "/bin/bash"
ENV TZ     "UTC"

VOLUME  "/root"
WORKDIR "/root"

EXPOSE 22

ENTRYPOINT [ "dumb-init", "--" ]
CMD        [ "docker-entrypoint.sh" ]

# Prepare YUM dependencies
RUN set -ex \
    && yum -y install epel-release https://centos7.iuscommunity.org/ius-release.rpm \
    && yum -y install ca-certificates curl gcc git2u libffi-devel make openssl-devel python python-devel redhat-rpm-config sudo \
    && yum -y clean all

# Install PIP
RUN set -ex \
    && curl -skL https://bootstrap.pypa.io/get-pip.py | python

# Copy files
COPY files /

# Bootstrap with Ansible
RUN set -ex \
    && cd /etc/ansible/roles/localhost \
    && pip install --upgrade --requirement requirements.txt \
    && molecule test \
    && yum -y clean all \
    && rm -rf /root/.cache/* \
    && rm -rf /tmp/*
