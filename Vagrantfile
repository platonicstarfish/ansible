# vim: ts=2:sw=2:syntax=ruby

Vagrant.require_version ">=1.8.0"

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/jammy64"
	config.disksize.size = '45GB'

	config.vm.provision "ansible" do |ansible|
		ansible.playbook = "devbox.yml"
	end

	config.vm.provider "virtualbox" do |v|
	  v.name = "devbox"
		v.gui = true
	end

end

