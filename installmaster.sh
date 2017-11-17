sudo add-apt-repository ppa:saltstack/salt
export DEBIAN_FRONTEND=noninteractive
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo echo deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main > /etc/apt/sources.list.d/saltstack-ubuntu-salt-xenial.list
sudo apt-get -y install salt-master salt-minion salt-ssh salt-cloud salt-doc
sudo apt-get update
sudo mkdir -p /srv/{salt,pillar}
sudo echo 'interface: 192.168.33.11' >> /etc/salt/master
sudo /etc/init.d/salt-master restart
sudo cp -R /vagrant/.vagrant/salt/* /srv/salt/ 