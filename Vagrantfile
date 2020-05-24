# Example 3
#
# Single box with VirtualBox provider and Puppet provisioning.
#
# NOTE: Make sure you have the precise32 base box installed...
# vagrant box add precise32 http://files.vagrantup.com/precise32.box
$script = <<-SCRIPT
echo I am provisioning...
sudo yum update
rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
sudo yum install -y puppet
echo Now puppet provision...
SCRIPT
Vagrant.configure("2") do |config|
  config.vm.define :dns do |dns|
    dns.vm.box = "bento/centos-7.7"
    dns.vm.network :private_network, ip: "192.168.50.2"
    dns.vm.hostname = "dns"
    dns.vm.provision "shell", inline: $script
    dns.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "dns.pp"
      puppet.module_path = "puppet/modules"
    end
  end
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
