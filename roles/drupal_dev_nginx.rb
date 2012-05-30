name "drupal_dev_nginx"
description "Development environment for Drupal (using nginx)"
run_list(
  "role[drupal_nginx]",
  "recipe[drupal::dev]"
)
