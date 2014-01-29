# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "ubuntu-workstation-berkshelf"
  config.vm.box = "opscode_centos-6.4_provisionerless"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.json = {

    }

    chef.run_list = "ubuntu-workstation::#{ENV['UW_RUN_LIST']}"
  end
end
