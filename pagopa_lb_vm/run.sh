#!/usr/bin/env bash

# see https://sap1ens.com/blog/2017/07/01/bash-scripting-best-practices/
set -o errexit
set -o pipefail
set -o xtrace

if [ -z "$1" ]
  then
    echo "Ansible repo version not specified. Please, try again."
fi

REPO_NAME=digital-citizenship-ansible-playbooks
VERSION=$1

# install prerequisites
export DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get -y install unzip
apt-get -y install ansible

wget https://github.com/teamdigitale/$REPO_NAME/archive/v$VERSION.zip

unzip v$VERSION.zip
cd $REPO_NAME-$VERSION/pagopa_lb_vm

# install roles
ansible-galaxy install -r requirements.yml

# run playbook
ansible-playbook main.yml

# signal successful execution
exit 0
