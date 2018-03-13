#!/usr/bin/env bash

# see https://sap1ens.com/blog/2017/07/01/bash-scripting-best-practices/
set -o errexit
set -o pipefail
set -o xtrace

REPO_NAME=digital-citizenship-ansible-playbooks
VERSION=0.0.4

# install prerequisites
apt-get update
apt-get install unzip
apt-get install ansible

wget https://github.com/teamdigitale/$(REPO_NAME)/archive/v$(VERSION).zip

unzip v$(VERSION).zip
cd $(REPO_NAME)-$(VERSION)

# install roles
ansible-galaxy install -r requirements.yml

# run playbook
ansible-playbook -K main.yml

# signal successful execution
exit 0
