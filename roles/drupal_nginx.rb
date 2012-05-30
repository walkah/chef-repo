name "drupal_nginx"
description "Requirements for a full nginx-based Drupal install"
run_list(
  "recipe[build-essential]",
  "recipe[mysql::server]",
  "recipe[php]",
  "recipe[php::module_mysql]",
  "recipe[php::module_apc]",
  "recipe[php::module_curl]",
  "recipe[php::module_gd]",
  "recipe[git]",
  "recipe[drush]",
  "recipe[drush::make]",
  "recipe[drupal::fpm]"
)
