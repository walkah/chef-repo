# install drupal requirements and setup site vhosts
require_recipe "drush"
require_recipe "drush::make"
require_recipe "nginx"

package "curl"
package "php5-gmp"

%w{ php5-fpm nginx-extras }.each do |a_package|
  package a_package
end

php_pear "uploadprogress" do
  action :install
end

if node[:drupal].has_key(:hosts)
  node[:drupal][:hosts].each do |site|
    template "/etc/nginx/sites-available/#{site}.conf" do
      source "nginx.conf.erb"
      mode "0640"
      owner "root"
      group "root"
      variables(
                :server_name => site,
                :server_aliases => ["*.#{site}"],
                :docroot => "#{node[:doc_root]}/#{site}",
                :logdir => "#{node[:nginx][:log_dir]}"
                )
    end

    nginx_site "#{site}.conf" do
      :enable
    end
  end
end
