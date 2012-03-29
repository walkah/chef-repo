name "drupal_dev"
description "Development environment for Drupal"
run_list(
  "role[drupal]",
  "recipe[xhprof]",
  "recipe[drupal::dev]"
)
