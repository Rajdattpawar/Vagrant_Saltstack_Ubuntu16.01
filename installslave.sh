sudo add-apt-repository ppa:saltstack/salt
export DEBIAN_FRONTEND=noninteractive
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo echo deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main > /etc/apt/sources.list.d/saltstack-ubuntu-salt-xenial.list
sudo apt-get -y install salt-minion
sudo apt-get update
sudo echo 'master: 192.168.33.11' >> /etc/salt/minion
sudo /etc/init.d/salt-minion restart


