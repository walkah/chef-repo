# -*- mode: ruby -*-
Vagrant::Config.run do |config|
  # basebox
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  #config.vm.box = "lucid64"
  #config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.share_folder "v-data", "/vagrant", ".", :nfs => true
  config.vm.forward_port 3306, 3306
  config.vm.customize ["modifyvm", :id, "--memory", "1024"]

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
                         :hosts => ["d7.dev", "d8.dev", "xhprof.dev"]
                       },
                       :drush => {
                         :install_method => 'pear',
                         :version => '5.2.0',
                       }
		      
                     })
  end
end
