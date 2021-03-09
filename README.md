# Initialize Ubuntu Clean Install

### Introduction

I have been using Ubuntu as my baseline for all home projects and just wanted to create a BASH script to setup my development system.  This basically installed my default apps and configures the system.



### Ubuntu ISO File

This script was tested with Ubuntu Desktop 18.04 operating system.  This ISO image can be downloaded using the below link:

http://old-releases.ubuntu.com/releases/18.04.4/ubuntu-18.04-desktop-amd64.iso



### File Descriptions

| File Name        | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| _gvimrc          | GVim configuration startup script                            |
| smb.cof          | Samba which configures the system to crate a "workspace" folder in home directory and then shares the "workspace" folder on the local network for transferring files. |
| ssh_config       | The SSH configuration file for the baseline system.          |
| sshd_config      | The SSH configuration file for the baseline system.          |
| ubuntu_config.sh | Script which installs default applications, append lines in .bashrc, and copies the system configuration file to operating directory. |



### Applications

Runs the package manager to install baseline applications for system.

```
apt-get -y update
apt-get -y install -q \
  build-essential \
  apt-utils \
  net-tools \
  git \
  putty \
  x11-apps \
  openssh-server \
  vim-gnome \
  samba \
  python-setuptools \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg

rm -fr /var/lib/apt/lists/*
```

