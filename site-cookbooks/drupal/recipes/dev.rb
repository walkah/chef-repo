require_recipe "build-essential"
require_recipe "drupal"

package 'git-core' # for dev checkouts
package 'squid3' # for speeding up drush_make

php_pear "xdebug" do
  action :install
end

template "/etc/php5/conf.d/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources("service[apache2]"), :delayed
end
