

# Fully functional Saltstack testing environment using Vagrant on ubuntu 16.04

This provide you fully functional Saltstack testing environment using Vagrant on ubuntu 16.04. Environment with pre-install latest version of salt-master salt-minion salt-ssh salt-cloud salt-doc

### Dependencies:
  - install latest version [VirtualBox](https://www.virtualbox.org/)
  - Install latest version [Vagrant](https://www.vagrantup.com/)

### How to Start:
  - Checkout https://github.com/Rajdattpawar/Vagrant_Saltstack_Ubuntu16.01/ in newly created folder
  - Run `vagrant up` to startup your VM
  - login to the mastersalt server server
      ssh ubuntu@192.168.33.11 
      password-e6189426acca8c09d8c0ef90
  - accept access keys of all minion
      salt-key -a * 
  - Test salt minion is working ot not
      salt '*' test.ping
  -  install php 7 on all minion
      salt '*' state.highstate
