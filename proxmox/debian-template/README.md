# docker-debian

The playbook configures a VM as a generic Debian server template.

## Install

Run the Debian graphical install on the machine.

Run the provisioning playbook.

```
ansible-playbook -k -K provision.yml -l lan
```

Run the main playbook.

```
ansible-playbook main.yml -l lan
```
