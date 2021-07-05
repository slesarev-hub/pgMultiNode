#!/bin/bash

ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa <<<y >/dev/null 2>&1

# ls -la
# ls -la .ssh

# ssh-keyscan -t rsa github.com > /home/.ssh/known_hosts

# git clone git@github.com:slesarev-hub/shardman.git

cd shardman/devops/
cp Vagrantfile.example Vagrantfile
vagrant up --provider virtualbox

sed -e 's/# \?//' inventory_manual/manual.example > inventory_manual/manual

pipenv install && pipenv shell
ansible-playbook -i inventory_manual/ provision.yml

ansible-playbook -i inventory_manual/ init.yml
