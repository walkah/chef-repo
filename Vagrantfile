# -*- mode: ruby -*-
Vagrant::Config.run do |config|
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
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.forward_port 3306, 3306

  # customizations 
  config.vm.customize ["modifyvm", :id, "--memory", conf['memory']]
  config.vm.customize ["modifyvm", :id, "--cpus", conf['cpus']]

  config.vm.share_folder "v-data", "/vagrant", ".", :nfs => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = "roles"
    chef.add_recipe ""

    chef.json = JSON.parse(File.read(node_json))

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
