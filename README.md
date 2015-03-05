#Attacksible
Ansible provisioned security platform for RPM based systems.

The first commit was written for Fedora 21.

Near future improvments:
* APT based system support
* More funky tools
* Install of the software from the git repos pulled in

Instal
-----

    yum install ansible

Usage
-----

    ansible-playbook play.yml -i attacksible --connection=local -K
