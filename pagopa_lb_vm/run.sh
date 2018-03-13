#!/usr/bin/env bash

# see https://sap1ens.com/blog/2017/07/01/bash-scripting-best-practices/
set -o errexit
set -o pipefail
set -o xtrace

VERSION=0.0.2

# install prerequisites
apt-get update
apt-get install unzip
apt-get install ansible

# download the playbook archive
wget https://github.com/teamdigitale/digital-citizenship-ansible-playbooks/archive/v$(VERSION).zip

unzip v$(VERSION)

cd digital-citizenship-ansible-playbooks-$(VERSION)

# install roles
ansible-galaxy install -r requirements.yml

# run playbook
ansible-playbook -K main.yml

# signal successful execution
exit 0
