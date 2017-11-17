vmdomain = '.salt.lcl'

saltmaster = {}
saltmaster[:ip_address] = '192.168.33.11'
saltmaster[:host_name] = 'saltmaster' + vmdomain

saltslaveOptions = {}
saltslaveOptions[:ip_address] = '192.168.33.12'
saltslaveOptions[:host_name] = 'bbcontroller' + vmdomain

saltslaveOptions = {}
saltslaveOptions[:ip_address] = '192.168.33.13'
saltslaveOptions[:host_name] = 'scriptserver' + vmdomain

Vagrant.configure(2) do |config|
  
	config.vm.box = "ubuntu/xenial64"
  
    config.vm.define "saltmaster" do |saltmaster|
		saltmaster.vm.network "private_network", ip: "192.168.33.11"
		saltmaster.vm.hostname = 'saltmaster.salt.lcl'
		saltmaster.vm.provision "shell", path: "installmaster.sh"
		saltmaster.vm.provision "shell", path: "add_user.sh"	
		
	end
	
	config.vm.define "bbcontroller" do |bbcontroller|
		bbcontroller.vm.network "private_network", ip: "192.168.33.12"
		bbcontroller.vm.hostname = 'bbcontroller.salt.lcl'
		bbcontroller.vm.provision "shell", path: "installslave.sh"	
		bbcontroller.vm.provision "shell", path: "add_user.sh"	
	end
	
	config.vm.define "scriptserver" do |scriptserver|
		scriptserver.vm.network "private_network", ip: "192.168.33.13"
		scriptserver.vm.hostname = 'scriptserver.salt.lcl'
		scriptserver.vm.provision "shell", path: "installslave.sh"	
		scriptserver.vm.provision "shell", path: "add_user.sh"	
	end
end
