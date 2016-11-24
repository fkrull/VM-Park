# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.synced_folder File.expand_path("~/Public"), "/Public", :mount_options => ["ro"]

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = 2
  end
 
 
  config.vm.define "Ubuntu 12.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1204-desktop"
    config.vm.provision "shell", path: "provision-debian.sh"
  end

  config.vm.define "Ubuntu 14.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1404-desktop"
    config.vm.provision "shell", path: "provision-debian.sh"
  end
  
  config.vm.define "Ubuntu 16.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-desktop"
    config.vm.provision "shell", path: "provision-debian.sh"
  end
  
  
  # Debian
  config.vm.define "Debian 8 (64 bit)" do |box|
    box.vm.box = "boxcutter/debian8-desktop"
    config.vm.provision "shell", path: "provision-debian.sh"
  end
  
  
  # Fedora
  config.vm.define "Fedora 23 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora23"
    config.vm.provision "shell", path: "provision-fedora.sh"
  end
  
  config.vm.define "Fedora 24 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora24"
    config.vm.provision "shell", path: "provision-fedora.sh"
  end
  
  
  # CentOS
  config.vm.define "CentOS 6 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos68-desktop"
    config.vm.provision "shell", path: "provision-centos.sh"
  end
  
  config.vm.define "CentOS 7 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos72-desktop"
    config.vm.provision "shell", path: "provision-centos.sh"
  end
  

  config.vm.define "Windows XP Pro (32 bit)" do |box|
    box.vm.box = "winxp32-professional"
  end
  
  config.vm.define "Windows 7 Enterprise (64 bit)" do |box|
    box.vm.box = "eval-win7x64-enterprise-nocm"
  end

end
