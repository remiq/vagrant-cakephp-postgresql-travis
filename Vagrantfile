

Vagrant.configure("2") do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.network :private_network, ip: '192.168.100.100'

    config.vm.synced_folder "deploy_root/", "/var/www"
    config.vm.synced_folder "database/", "/var/db"

    config.vm.provision :puppet
end


