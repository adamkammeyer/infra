# cloudron

This playbook configures a base Ubuntu system prior to running the [Cloudron](https://cloudron.io) installer.

This is a work-in-progress.

## Install

Run the Ubuntu graphical install on the machine.

If necessary, update the user info in `provision.yml` to match the user created during the install.

Run the provisioning playbook.

```
ansible-playbook -e @secretsfile.yml --vault-password-file=/path/to/file -k -K provision.yml -l <server>
```

Run the main playbook.

```
ansible-playbook -e @secretsfile.yml --vault-password-file=/path/to-file main.yml -l <server>
```
