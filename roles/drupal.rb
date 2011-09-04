name "drupal"
description "Requirements for a full LAMP-based Drupal install"
run_list(
  "role[lamp]",
  "recipe[php::module_curl]",
  "recipe[php::module_gd]",
  "recipe[drupal]"
)
