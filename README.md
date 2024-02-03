# system_install

Ansible playbooks and config files to configure Arch systems after running archinstall and to keep it updated. A network connection is expected to be working with the target system.

## Running remotely

When running the playbooks to configure a system remotely, network routing has to work between the computers and the ansible host running them has to have the ability to SSH to the target machine.

1. Install ssh server on the target: `sudo pacman -S openssh`, if not already installed.
2. Start (and enable) the SSH server with `sudo systemctl start sshd`.
3. Import SSH key to the target with `ssh-copy-id` to not have to input the password all the time.
4. Install python on the target: `sudo pacman -S python`.
5. Add the hostname defined in the used inventory on the running computer in `~/.ssh/config`. It should have the normal user and not root.
6. Create a new vars file for the target system.
7. Sync the `./secrets` folder.
8. Install yay Ansible library: `ansible-galaxy collection install kewlfft.aur`.

Example command:

```
ansible-playbook --vault-password-file=secrets/ansible_vault_password -i inventory --extra-vars=@vars/huron.yml playbooks/01-packages.yml
```

## The `./secrets` directory

It includes the Ansible vault password to decrypt all encrypted variables like passwords used in environment files. Also wireguard configurations are stored there.

It should be synced inside the repository to all devices with Syncthing which run any playbooks.

## Wallpapers

Metadata should be stripped before committing images to the repository. On Arch `perl-image-exiftool` has to be installed before running.

Remove metadata by overwriting all image files here:

```sh
exiftool -overwrite_original -recurse -all= ./wallpapers
```

## Troubleshooting

### Error message when installing yay

A python module is probably missing, install it with `sudo pacman -S python-pexpect`.
