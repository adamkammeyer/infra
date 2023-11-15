# docker-debian

The playbook configures a VM as a generic Docker server running on top of Debian.

## Install

Run the Debian graphical install on the machine.

If necessary, update the user info in `provision.yml` to match the user created during the install.

Run the provisioning playbook.

```
ansible-playbook -e @secrets.yml --vault-password-file=/path/to/file -k -K provision.yml
```

Run the main playbook.

```
ansible-playbook -e @secrets.yml --vault-password-file=/path/to/file
```

Dockerized services have their own playbooks with a specific tag structure:

* `install`: Create any users and directories needed for the container. Pull the image and start the container.
* `remove`: Delete the currently running container, but leave the data directories.
* `purge`: Delete the currently running container AND the data directories.

