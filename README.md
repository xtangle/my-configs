# my-configs

This repository contains configurations for most of the development tools that I use. It also contains some useful scripts
(`import-configs.sh`, `export-configs.sh`) that handles the importing/exporting of these configurations automatically. 

There is a script named `provision.sh` that is intended to run as the last step in the provisioning process 
of a new development machine. The full provisioning process and the Vagrant box for the development machine 
can be found in my other repository: https://github.com/xtangle/devbox

## Prerequisites

It is mandatory to run the shell scripts in this repository inside the aforementioned Vagrant machine, and
have the https://github.com/xtangle/devbox repository cloned in the same directory as this repository, 
i.e. under `${HOME}/Projects`. This is because paths to some scripts in the other repository are hard-coded 
and referenced here to reduce duplicate code. Though this can be done with Git sub-modules, I would like
the changes to be reflected in real-time without having to commit them.
