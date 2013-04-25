# -*- mode: ruby -*-
require 'yaml'

Vagrant.configure("2") do |config|
  current_dir = File.dirname(__FILE__)
  config_file = "#{current_dir}/config/vagrant.yml"

  node_json = ENV['node'] ||= "#{current_dir}/config/node.json"

  if File.exists?(config_file)
    conf = YAML.load_file(config_file)
  else
    p "No config file found."
    exit
  end

  # basebox
  config.vm.box = conf['box']
  config.vm.box_url = conf['box_url']

  # network
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.network :forwarded_port, guest: 3306, host: 3306

  # customizations 
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", conf['memory']]
    vb.customize ["modifyvm", :id, "--cpus", conf['cpus']]
  end

  #config.vm.share_folder "v-data", "/vagrant", ".", :nfs => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = "roles"

    dna = JSON.parse(File.read(node_json))

    chef.run_list = dna["run_list"]

    chef.json.merge!(dna)
    chef.json.merge!({
                       :mysql => {
                         :server_root_password => "root",
                         :server_debian_password => "root",
                         :server_repl_password => "root",
                         :allow_remote_root => true,
                         :bind_address => '0.0.0.0',
                       },
                     })
  end
end
