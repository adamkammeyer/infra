# proxy

The playbook configures a VM as a Caddy reverse proxy running on top of Debian.

## Install

See proxy/terraform for instructions.

If necessary, update the user info in `provision.yml` to match the user created during the install.

Run the provisioning playbook.

```
ansible-playbook -e @secrets.yml --vault-password-file=/path/to/file -k -K provision.yml
```

Run the main playbook.

```
ansible-playbook --tags base,caddy -e @secrets.yml --vault-password-file=/path/to/file
```

## Updating Caddy

```
ansible-playbook --tags caddy -e @secrets.yml --vault-password-file=/path/to/file
```

## Adding a new domain

```
ansible-playbook --tags config -e @secrets.yml --vault-password-file=/path/to/file
```