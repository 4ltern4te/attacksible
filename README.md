Attacksible
===========

Ansible provisioned security platform.

Tested on:
* Fedora 21
* Debian 7,8

Features
-------

- Run an audit platform on your own host configuration.
- Quickly spin up fresh machines.
- Ability to modify the selection of packages and system config.
- Easily install various pentesting, auditing and security related tools. Some are system-wide, otherwise
categorised in `/opt/attacksible`
- Various wordlists to `/opt/attacksible/wordlists`
- Sets up metasploit database
- Installs ruby via rvm

There are many more ideas. There are a few bugs.


Install
-----

    sudo yum install ansible || sudo apt-get install ansible

or

    git clone --recursive https://github.com/ansible/ansible.git
    source ansible/hacking/env-setup

### For the full desktop install
    ansible-playbook play.yml -i attacksible --connection=local -K

### Headless
    ansible-playbook play.yml -i attacksible --skip-tags 'gui' --connection=local -K

### Untested software
Software we're yet to confirm as stable in the system has been tagged with 'untested'.  
These can be excluded by issuing `--skip-tags 'untested'`

    ansible-playbook play.yml -i attacksible --skip-tags 'untested' --connection=local -K

Usage
-----

- Tools will be located in `/opt/attacksible`, or otherwise installed globally as system packages
- Wordlists are available in /opt/attacksible/wordlists
- Most things require root presently, it's soon on the todo list.  `sudo chown $(whoami): -R /opt/attacksible`
