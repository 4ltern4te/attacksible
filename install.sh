#!/usr/bin/env bash

# Update
git pull --rebase

SKIP="exploitdb"

# Install
ansible-playbook play.yml -i attacksible --connection=local -K --skip-tags "${SKIP}"
