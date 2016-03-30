#
# Cookbook Name:: php
# Attributes:: fpm
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["php"]["fpm"]["enabled"] = node.recipes.include?("nginx")

default["php"]["fpm"]["packages"] = value_for_platform_family(
  "debian" => %w(
    php5-fpm
  ),
  "suse" => %w(
    php5-fpm
  )
)

default["php"]["fpm"]["removed_files"] = %w()
default["php"]["fpm"]["removed_links"] = %w()

default["php"]["fpm"]["removed_dirs"] = %w(
  /etc/php5/fpm/conf.d
)

default["php"]["fpm"]["create_dirs"] = %w(
  /etc/php5/fpm/pool.d
)

default["php"]["fpm"]["create_symlinks"] = {
  "/etc/php5/fpm/conf.d" => "/etc/php5/conf.d"
}

default["php"]["fpm"]["www"]["config_file"] = "/etc/php5/fpm/php.ini"
default["php"]["fpm"]["www"]["max_execution_time"] = 0
default["php"]["fpm"]["www"]["memory_limit"] = "2048M"
default["php"]["fpm"]["www"]["display_errors"] = false
default["php"]["fpm"]["www"]["display_startup_errors"] = false
default["php"]["fpm"]["www"]["post_max_size"] = "128M"
default["php"]["fpm"]["www"]["upload_max_filesize"] = "128M"
default["php"]["fpm"]["www"]["fix_pathinfo"] = "0"

default["php"]["fpm"]["service_name"] = value_for_platform_family(
  "debian" => "php5-fpm",
  "suse" => "php-fpm"
)

default["php"]["fpm"]["config_file"] = "/etc/php5/fpm/php-fpm.conf"
default["php"]["fpm"]["pool_dir"] = "/etc/php5/fpm/pool.d"
default["php"]["fpm"]["log_dir"] = "/var/log/php5-fpm"
default["php"]["fpm"]["run_dir"] = "/var/run/php5-fpm"

default["php"]["fpm"]["default"]["enabled"] = node["php"]["fpm"]["enabled"]

case node["platform_family"]
when "debian"
  default["php"]["fpm"]["default"]["user"] = default["php"]["server"]["user"] = "www-data"
  default["php"]["fpm"]["default"]["group"] = default["php"]["server"]["group"] = "www-data"
  default["php"]["fpm"]["default"]["service"] = default["php"]["server"]["service"] = nil
  default["php"]["fpm"]["default"]["dir"] = "/var/www"
when "suse"
  default["php"]["fpm"]["default"]["user"] = default["php"]["server"]["user"] = "wwwrun"
  default["php"]["fpm"]["default"]["group"] = default["php"]["server"]["group"] = "www"
  default["php"]["fpm"]["default"]["service"] = default["php"]["server"]["service"] = nil
  default["php"]["fpm"]["default"]["dir"] = "/srv/www/htdocs"
end

case
when node.recipes.include?("nginx")
  default["php"]["fpm"]["default"]["dir"] = node["nginx"]["web_dir"]
  default["php"]["fpm"]["default"]["user"] = default["php"]["server"]["user"] = node["nginx"]["user"]
  default["php"]["fpm"]["default"]["group"] = default["php"]["server"]["group"]= node["nginx"]["group"]
  default["php"]["fpm"]["default"]["service"] = default["php"]["server"]["service"] = "nginx"
when node.recipes.include?("apache")
  default["php"]["fpm"]["default"]["dir"] = node["apache"]["web_dir"]
  default["php"]["fpm"]["default"]["user"] = default["php"]["server"]["user"] = node["apache"]["user"]
  default["php"]["fpm"]["default"]["group"] = default["php"]["server"]["group"] = node["apache"]["group"]
  default["php"]["fpm"]["default"]["service"] = default["php"]["server"]["service"] = "apache2"
end

