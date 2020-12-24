# Preparing a base Vagrant box

The following steps were done in preparation of the Pop!_OS 20.04 and 20.10 base boxes.

## Create VM in Virtualbox

Create VM as per usual in Virtualbox, with the following settings:

- Name - same as box name (eg. pop-os_20.04)
- Hard disk - recommend 20GB (dynamically allocated) VMDK file type
- Memory - initially can be anything; change to the default (usually 1024MB) before packaging
- Graphics memory - initially can be anything; change to default (usually 25MB) before packaging
- Graphics controller - VMSVGA
- Processor - initially can be anything; change to 1 before packaging
- Other configuration
    - Leave the Shared Clipboard and Drag'n'Drop features disabled
    - Leave 3D acceleration off

Keep in mind all amounts should be conservative as possible while allowing enough room for basic functionality.
All values can be adjusted from the Vagrantfile after the user downloads the box.

## Install from ISO Image

1. Mount ISO image to optical drive of VM
1. Go through the installation process, selecting all default values when applicable
1. Reboot
1. When asked to create the user, enter "vagrant" for Full Name, username, and password

## Configure user

1. Run `sudo visudo`
1. Add the following to the end of the file and save:

    ```
    # Allow password-less sudo for the "vagrant" user
    vagrant ALL=(ALL) NOPASSWD: ALL
    ```

## Configure system

1. Update system packages:

    ```shell
    sudo apt-get update
    sudo apt-get upgrade
    ```

1. Reboot
1. Install any Operating System updates in the Pop!_Shop, if any
1. Reboot 
1. Install Guest Additions (insert guest additions ISO image)
1. Reboot
1. Test if guest additions is installed correctly by maximizing the window. The VM display should automatically expand to fit the maximized window.
1. Remove the guest additions ISO from the optical drive

## Configure SSH

1. Install `openssh-server` and enable the ssh service:

    ```shell
    sudo apt-get install openssh-server
    sudo systemctl status ssh
    sudo systemctl enable ssh
    sudo systemctl start ssh
    ```

1. Allow ssh through firewall

    ```shell
    sudo ufw allow ssh
    sudo ufw status
    ```

1. Add the Vagrant public key to the list of authorized keys:

    ```shell
    cd ~
    mkdir .ssh
    chmod 0700 .ssh
    cd ~/.ssh
    curl https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub >> authorized_keys
    cat authorized_keys
    chmod 0600 authorized_keys
    ```

## Other Configuration

The following is necessary for Pop!_OS since Vagrant (version 2.2.14) does not recognize it as being a Linux distro out of the box.

When Vagrant starts, it run over a pre-defined list of commonly-used VM types and uses a script block similar to the one below to test a match:

```shell
if test -r /etc/os-release; then
  source /etc/os-release && test 'xlinux' = "x$ID" && exit
fi
if test -x /usr/bin/lsb_release; then
  /usr/bin/lsb_release -i 2>/dev/null | grep -qi 'linux' && exit
fi
if test -r /etc/issue; then
  cat /etc/issue | grep -qi 'linux' && exit
fi
exit 1
```

Unfortunately, Pop!_OS is not in the list, and the test fails to identify it as being a known type.

The least obtrusive way to overcome this issue is to add the word "Linux"  to `/etc/issue`, so that the third condition matches
and Vagrant is able to identify it as a Linux type VM:

```shell
cat /etc/issue
sudo sh -c 'echo "Pop!_OS Linux 20.04 LTS \\\n \l\n" > /etc/issue' # For 20.04
sudo sh -c 'echo "Pop!_OS Linux 20.10 \\\n \l\n" > /etc/issue' # For 20.10
cat /etc/issue
```

## Publish Vagrant Box

1. Log into the VM one last time to clear the bash history
   
    ```shell
    history -c
    sudo history -c
    ```

1. Configure VM settings to their initial, default values

1. Package VM into a Vagrant box file

    ```
    vagrant package --base pop-os_20.10
    mv package.box pop-os_20.04_20201223.0.0.box
    ```

1. Generate MD5 hash to be used for file integrity later (on Windows)

    ```
    CertUtil -hashfile pop-os_20.04_20201223.0.0.box MD5
    ```

1. Create new release on Vagrant website: https://app.vagrantup.com/
