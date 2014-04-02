# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hansode/centos-6.5-x86_64"

  config.vm.provider :virtualbox do |v, override|
   # Disable the base shared folder, guest additions are unavailable.
   #override.vm.synced_folder ".", "/vagrant", disabled: true
   #v.gui = true
   #v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provider :vmware_workstation do |v, override|
   # Disable the base shared folder, guest additions are unavailable.
    override.vm.synced_folder ".", "/vagrant", disabled: true
   #v.gui = true
   #v.vmx["memsize"]  = "2048"
   #v.vmx["numvcpus"] = "2"

   ## eth1
   #v.vmx["ethernet1.present"]        = "TRUE"
   #v.vmx["ethernet1.connectionType"] = "hostonly"
   #v.vmx["ethernet1.virtualDev"]     = "e1000"
   #v.vmx["ethernet1.wakeOnPcktRcv"]  = "FALSE"
  end

  config.vm.provision "shell", path: "bootstrap.sh"     # Bootstrapping: package installation (phase:1)
  config.vm.provision "shell", path: "config.d/base.sh" # Configuration: node-common          (phase:2)

 #config.vm.define "node01" do |node|
 #  node.vm.hostname = "node01"
 #  node.vm.provision "shell", path: "config.d/#{node.vm.hostname}.sh" # Configuration: node-specific (phase:2.5)
 #end

 #2.times.each { |i|
 #  name = sprintf("node%02d", i + 1)
 #  config.vm.define "#{name}" do |node|
 #    node.vm.hostname = "#{name}"
 #    node.vm.provision "shell", path: "config.d/#{node.vm.hostname}.sh" # Configuration: node-specific (phase:2.5)
 #   end
 #}
end
