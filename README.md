Attacksible
===========

Ansible provisioned security platform.

Presently supporting Fedora and Debian.

We plan to do an overhaul of the project shortly...
- restructure the categories
- loads of tools to add
- uplift the configs to newer ansible magic
- attack automation using the tools installed
- if we get time we might get the git repo projects (at least the bigger ones) built and installed

Features
-------

- Run an audit platform on your own host configuration.
- Quickly spin up fresh machines.
- Ability to modify the selection of packages and system config.
- Easily install various pentesting, auditing and security related tools. Some are system-wide, otherwise
categorised in `/opt/attacksible`
- Various wordlists to `/opt/attacksible/wordlists`
- Sets up the metasploit database
- Install rubys via rvm

There are many more ideas. There are a few bugs.


Install
-----

    sudo yum install ansible || sudo apt-get install ansible || sudo dnf install python-dnf ansible

or

    git clone --recursive https://github.com/ansible/ansible.git
    source ansible/hacking/env-setup

### For the full desktop install
    ansible-playbook play.yml -i attacksible --connection=local -K --skip-tags "exploitdb"

### Headless
    ansible-playbook play.yml -i attacksible --skip-tags 'gui,exploitdb' --connection=local -K

### Untested software
Software we're yet to confirm as stable in the system has been tagged with 'untested'.  
These can be excluded by issuing `--skip-tags 'untested'`

    ansible-playbook play.yml -i attacksible --skip-tags 'untested,exploitdb' --connection=local -K

### Exploit-DB
You'll notice that each of the above install lines are skipping `exploitdb`. This is because it's quite large.
You can easily include the pulling down of the exploit-db repository by removing this from `--skip-tags`

It is recommended to reboot your system after the install completes.
If you experience any issues please raise an issue on github.


Usage
-----

- Tools will be located in `/opt/attacksible`, or otherwise installed globally as system packages
- Wordlists are available in `/opt/attacksible/wordlists`
- Most things require root presently, fixing this is on the todo list.  `sudo chown $(whoami): -R /opt/attacksible`
