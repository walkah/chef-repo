# install drupal requirements and setup site vhosts
require_recipe "drush"
require_recipe "drush::make"

package "curl"
package "php5-gmp"
# TODO : curlrc here.

php_pear "uploadprogress" do
  action :install
end

if node[:drupal].has_key(:hosts)
  node[:drupal][:hosts].each do |site|
    web_app site do
      server_name site
      server_aliases ["*.#{site}"]
      docroot "#{node[:doc_root]}/#{site}"
    end
  end
end
