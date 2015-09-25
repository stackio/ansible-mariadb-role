#!/bin/sh
set -ex

VERBOSE=
RELEASE=10

while getopts ":v:r:" opt; do
  case $opt in
    v)
      VERBOSE="-v"
      ;;
    r)
      RELEASE=${OPTARG}
      ;;
  esac
done

ansible-playbook -i tests/inventory tests/test-${RELEASE}.yml --syntax-check --list-tasks

#ansible-galaxy install -r requirements.yml

ANSIBLE_CONFIG=tests/ansible.cfg ansible-playbook -i tests/inventory tests/test-${RELEASE}.yml -c local $VERBOSE

# Idempotence Test
ANSIBLE_CONFIG=tests/ansible.cfg ansible-playbook -i tests/inventory tests/test-${RELEASE}.yml | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)
