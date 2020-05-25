#Put your $script here

Vagrant.configure("2") do |config|
  config.vm.define :http do |http|
    http.vm.box = "bento/centos-7.7"
    http.vm.network :private_network, ip: "192.168.50.3"
    http.vm.hostname = "http"
    http.vm.provision "shell", inline: $script
    http.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "http.pp"
      puppet.module_path = "puppet/modules"
    end
  end
  config.vm.define :ftp do |ftp|
    ftp.vm.box = "bento/centos-7.7"
    ftp.vm.network :private_network, ip: "192.168.50.4"
    ftp.vm.hostname = "ftp"
    ftp.vm.provision "shell", inline: $script
    ftp.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "ftp.pp"
      puppet.module_path = "puppet/modules"
    end
  end
  config.vm.define :cliente do |cliente|
    cliente.vm.box = "bento/centos-7.7"
    cliente.vm.network :private_network, ip: "192.168.50.5"
    cliente.vm.hostname = "cliente"
    cliente.vm.provision "shell", inline: $script
    cliente.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "cliente.pp"
      puppet.module_path = "puppet/modules"
    end
  end  
end
