Workstation
============

This playbook configures a Fedora Workstation.  

Before running, install Fedora and update the system through `dnf`.

```
$ sudo dnf update
```

TBD: Obtain a copy of this repo 

Install Ansible

```
$ cd /path/to/repo/workstation
$ ./ansible.sh
```

Install Ansible dependencies

```
$ ansible-galaxy install -r requirements.yml
```

Run the main playbook

```
$ ansible-playbook main.yml -l local -K
```

The `-l local` restricts the run to the `local` group in the hosts file.

The `-K` will prompt for the sudo password.  Not all tasks require sudo.  Those that do specifically enable `become: yes` for that task.

Tag definitions:

* `system`: Anything to configure the base OS, not including software that runs on top of it.
* `flatpak`: Ensure the flatpak system is properly configured for all of Flathub.
* `gnome`: Set GNOME 3 configuration to my preferences.
* `base`: Install a core (to me) set up packages not included with the base OS.
* `vscode`: Install and configure [VS Code](https://code.visualstudio.com/).
* `starship`: Install and configure [Starship](https://starship.rs).