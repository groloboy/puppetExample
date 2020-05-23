# Example 3
#
# Single box with VirtualBox provider and Puppet provisioning.
#
# NOTE: Make sure you have the precise32 base box installed...
# vagrant box add precise32 http://files.vagrantup.com/precise32.box
$script = <<-SCRIPT
echo I am provisioning...
rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
sudo yum install -y puppet
echo Now puppet provision...
SCRIPT
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.7"
  config.vm.hostname = "centos7"
  config.vm.network :private_network, ip: "192.168.50.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--cpuexecutioncap", "50",
      "--memory", "256",
    ]
  end
  config.vm.provision "shell", inline: $script
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
  end
end
