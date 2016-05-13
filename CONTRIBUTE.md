How to help improve the project
===============================

role structure
--------------

Example:
```

# RANDOM TOOLS / WORDLISTS / STUFF

## REDHAT

- name: "<describe>"
  package: name={{ item }} state=present
  with_items:
    - package_name
  when:
    - ansible_os_family == "RedHat"

- name: "Fedora-only <describe>"
  package: name={{ item }} state=present
  with_items:
    - package_name
  when: ansible_distribution == 'Fedora'

- name: "GUI environment <describe>"
  package: name={{ item }} state=present
  with_items:
    - package_name
  when:
    - ansible_os_family == "RedHat"
  tags: gui


## DEBIAN

- name: "<describe>"
  apt: name={{ item }} state=present
  with_items:
    - package_name
  when:
    - ansible_os_family == "RedHat"

- name: "GUI environment <describe>"
  apt: name={{ item }} state=present
  with_items:
    - package_name
  when:
    - ansible_os_family == "Debian"
  tags: gui

## All

- name: <Some command we run>
  command: echo

- name: "Pip packages"
  shell: pip install {{ item }} 
  with_items:
    - pip_name
```
