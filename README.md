#Attacksible
Ansible provisioned security platform for RPM based systems.

Tested on:
* Fedora 21

Near future improvements:
* APT based system support
* More funky tools
* Install of the software from the git repos pulled in

Install
-----

    yum install ansible

or

    git clone --recursive https://github.com/ansible/ansible.git
    source ansible/hacking/env-setup

Usage
-----

### For the full desktop install
    ansible-playbook play.yml -i attacksible --connection=local -K

### Headless
    ansible-playbook play.yml -i attacksible --skip-tags 'gui' --connection=local -K

### Untested software
Software we're yet to confirm as stable in the system has been tagged with 'untested'.  
These can be excluded by issuing `--skip-tags 'untested'`

    ansible-playbook play.yml -i attacksible --skip-tags 'untested' --connection=local -K

Tools will be located in /opt/attacksible, or otherwise installed globally as system packages
