#!/usr/bin/env bash

# see https://sap1ens.com/blog/2017/07/01/bash-scripting-best-practices/
set -o errexit
set -o pipefail
set -o xtrace

# install prerequisites
apt-get update
apt-get install ansible

# install roles
ansible-galaxy install -r requirements.yml

# run playbook
ansible-playbook -K main.yml

# signal successful execution
exit 0
