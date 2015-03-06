[[doc/attacksible.jpg]]

Ansible provisioned security platform for RPM based systems.

The first commit was written for Fedora 21.

Near future improvments:
* APT based system support
* More funky tools
* Install of the software from the git repos pulled in

Install
-----

    yum install ansible

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
