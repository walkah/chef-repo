name "base_hosted"
description "Base role applied to all chef hosted nodes"
override_attributes(
  "chef_client" => {
    "init_style" => "init",
    "server_url" => "https://api.opscode.com/organizations/walkah",
    "validation_client_name" => "walkah-validator"
  }
)
run_list(
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client::config]",
  "recipe[chef-client::service]"
)
