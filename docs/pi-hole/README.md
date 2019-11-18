# Setting Up Pi-hole

This is a step-by-step summary on setting up Pi-hole on a Raspberry Pi Zero W as a DNS server over WLAN.

## Setup Steps

1. Install OS (Raspbian headless)
1. Connect to wireless network
1. Change Raspberry Pi settings:
    - `sudo raspi-config`
    - Change default username/password
    - Network Options -> Set hostname to eg. `pi-hole`
    - Localization Options -> Set Timezone
    - Boot Options -> Enable console autologin and wait for network at boot
    - Interfacing Options -> Enable SSH
    - Update
1. Install tools: `sudo apt install vim unattended-upgrades`
    - The `unattended-upgrades` package will automatically perform update/upgrades periodically, but requires some additional configuration to work properly for Raspbian systems:
        1. Open the `/etc/apt/apt.conf.d/50unattended-upgrades` file as sudo, this file should be installed automatically from the `unattended-upgrades` package
        1. In the `Unattended-Upgrade::Origins-Pattern` section, add the following lines, and save:
            ```text
            "origin=Raspbian,codename=${distro_codename},label=Raspbian";
            "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation";
            ``` 
        1. Next, apply the steps in this guide: https://libre-software.net/ubuntu-automatic-updates/
1. Set up script to automatically restart wireless network when network connection is dropped:
    - As sudo, create the file `/usr/local/bin/checkwifi.sh` with contents:
        ```shell script
        echo "Current timestamp: $(date)"
        echo "Checking wifi network connection..."
        
        ping -c4 192.168.1.1 > /dev/null
         
        if [ $? -eq 0 ]; then
          echo "Network connection is up"
        else
          echo "No network connection, restarting wlan0"
          /sbin/ifdown 'wlan0'
          sleep 5
          /sbin/ifup --force 'wlan0'
          echo "Done"
        fi
        ```
        Replace 192.168.1.1 with your gateway IP if needed be.
    - Make sure script has correct permissions: `sudo chmod 775 /usr/local/bin/checkwifi.sh`
    - Create a crontab to run this script every 5 minutes:
        1. Edit crontab with `crontab -e`
        1. Add the following line: `*/5 * * * * /usr/bin/sudo -H /usr/local/bin/checkwifi.sh 2>&1 > /home/pi/checkwifi.log`
    - Credit to https://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/ for providing these steps
1. In the router, reserve a static IP for the Raspberry Pi, remember this IP
1. Restart the Raspberry Pi to make sure all settings are saved
1. Install pi-hole, see: https://github.com/pi-hole/pi-hole/#one-step-automated-install
    - During installation, when asked to select the upstream DNS server, the following benchmark tool is useful to determine which DNS server is the fastest: https://www.grc.com/dns/benchmark.htm
1. When installation is finished, configure router's DNS to **only** be the IP of the Raspberry Pi where pi-hole is installed
1. (Optional) To enable Pi-hole to list names instead of IPs of devices on a LAN (assuming DHCP server is enabled on the router), a feature called conditional forwarding on the Pi-hole has to be enabled:
    1. In the Pi-hole web admin page, go to DNS settings: http://pi.hole/admin/settings.php?tab=dns
    1. In the Conditional Forwarding section, use Conditional Forwarding, and enter the IP address of the router (i.e. 192.168.1.1) and the local domain name (i.e. lan)
        - A local domain name may have to be defined in the router's DHCP server settings if it doesn't exist  

## Useful Resources

- Pi-hole Github repo, containing installation instructions and more: https://github.com/pi-hole/pi-hole
- Pi-hole documentation: https://docs.pi-hole.net/
- Crontab to automatically restart wireless network connection when network goes down: https://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/
- Stack Overflow answer to making `unattended-upgrades` package work on Raspbian OS: https://raspberrypi.stackexchange.com/a/38990
- Pi-hole subreddit page: https://www.reddit.com/r/pihole/ 
- Other guides on setting up Pi-hole on a Raspberry Pi Zero:
    - http://blog.deadlypenguin.com/blog/2019/02/11/pi-hole-setup-raspberry-pi-zero/
    - https://learn.adafruit.com/pi-hole-ad-blocker-with-pi-zero-w/install-pi-hole
    
### Blocklists

- Wally3K's curated list of blocklists: https://v.firebog.net/hosts/lists.php

### Whitelists

- anudeepND's list of whitelists: https://github.com/anudeepND/whitelist
