# Preparing a base Vagrant box

The following steps were done in preparation of the Pop!_OS 20.04 and 20.10 base boxes.

## Configure user

1. Run `sudo visudo`
1. Add the following to the end of the file and save:

    ```
    # Allow password-less sudo for the "vagrant" user
    vagrant ALL=(ALL) NOPASSWD: ALL
    ```

## Configure system

1. Update system packages:

    ```
    sudo apt-get update
    sudo apt-get upgrade
    ```

1. Reboot
1. Install Guest Additions (insert guest additions ISO image)
1. Reboot

## Configure SSH

1. Install `openssh-server` and enable the ssh service:

    ```
    sudo apt-get install openssh-server
    sudo systemctl status ssh
    sudo systemctl enable ssh
    sudo systemctl start ssh
    ```

1. Allow ssh through firewall

    ```
    sudo ufw allow ssh
    sudo ufw status
    ```

1. Add the Vagrant public key to the list of authorized keys:

    ```
    cd ~
    mkdir .ssh
    chmod 0700 .ssh
    cd ~/.ssh
    curl https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub >> authorized_keys
    chmod 0600 authorized_keys
    ```
