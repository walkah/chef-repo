name "drupal_dev"
description "Development environment for Drupal"
run_list(
  "role[drupal",
  "recipe[drupal::dev]"
)
