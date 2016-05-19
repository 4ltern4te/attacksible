#!/usr/bin/env bash
ansible-playbook play.yml -i attacksible --skip-tags "exploitdb" --connection=local -K
