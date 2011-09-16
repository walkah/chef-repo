Vagrant::Config.run do |config|
  # basebox
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.network "33.33.33.10"
  config.vm.share_folder "v-data", "/vagrant", ".", :nfs => true
  config.vm.forward_port "mysql", 3306, 3306
  config.vm.customize do |vm|
    vm.memory_size = 1024
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = "roles"
    chef.add_role "drupal_dev"

    chef.json.merge!({
                       :doc_root => '/vagrant/public',
                       :mysql => {
                         :server_root_password => "root",
                         :allow_remote_root => true,
                         :bind_address => '0.0.0.0',
                       },
                       :drupal => {
                         :hosts => ["d7.dev"]
                       }
		      
                     })
  end
end
