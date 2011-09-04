name "lamp"
description "Basic LAMP stack"
run_list(
  "recipe[mysql::server]",
  "recipe[php::package]",
  "recipe[php::module_mysql]",
  "recipe[apache2]",
  "recipe[apache2::mod_expires]",
  "recipe[apache2::mod_php5]",
  "recipe[apache2::mod_rewrite]"
)
