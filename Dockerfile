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

FROM centos/systemd:latest

ENV LANG   "en_US.UTF8"
ENV LC_ALL "en_US.UTF8"
ENV SHELL  "/bin/bash"
ENV TZ     "UTC"

VOLUME  "/root"
WORKDIR "/root"

EXPOSE 22

ENTRYPOINT [ "dumb-init", "--" ]
CMD        [ "docker-entrypoint.sh" ]

# Prepare YUM depedencies
RUN set -ex \
    && yum -y install epel-release \
    && yum -y install curl gcc git libffi-devel openssl-devel python python-devel redhat-rpm-config \
    && yum -y clean all

# Install PIP
RUN set -ex \
    && curl -skL https://bootstrap.pypa.io/get-pip.py | python

# Install Ansible
RUN set -ex \
    && pip install ansible yamllint \
    && rm -rf /root/.cache/pip

# Install dumb-init
RUN set -ex \
    && curl -skL https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 > /usr/local/bin/dumb-init \
    && chown root:root /usr/local/bin/dumb-init \
    && chmod 0755 /usr/local/bin/dumb-init

# Copy files
COPY files /

# Bootstrap with Ansible
RUN set -ex \
    && ansible-galaxy install --force --roles-path /etc/ansible/roles --role-file /etc/ansible/ansible-role-requirements.yml \
    && yamllint --config-file /etc/ansible/.yamllint /etc/ansible \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml --syntax-check \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml --diff \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml --diff
