#
# Cookbook Name:: php
# Attributes:: default
#
# Copyright 2013, Thomas Boerger
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

case node["platform_family"]
when "debian"
  default["php"]["packages"] = %w(
    libgd2-xpm
    php5-fpm
    php5-cli
    php5-curl
    php5-intl
    php5-mcrypt
    php5-xmlrpc
    php5-xsl
    php5-tidy
    php5-gd
    php5-imagick
    php5-dev
    php-pear
  )

  default["php"]["removed_files"] = %w(
    /usr/sbin/php5enmod
    /etc/php5/mods-available/curl.ini
    /etc/php5/mods-available/gd.ini
    /etc/php5/mods-available/intl.ini
    /etc/php5/mods-available/mcrypt.ini
    /etc/php5/mods-available/pdo.ini
    /etc/php5/mods-available/tidy.ini
    /etc/php5/mods-available/xmlrpc.ini
    /etc/php5/mods-available/xsl.ini
  )

  default["php"]["removed_links"] = %w(
    /usr/sbin/php5dismod
    /etc/php5/conf.d/10-pdo.ini
    /etc/php5/conf.d/20-curl.ini
    /etc/php5/conf.d/20-gd.ini
    /etc/php5/conf.d/20-intl.ini
    /etc/php5/conf.d/20-mcrypt.ini
    /etc/php5/conf.d/20-tidy.ini
    /etc/php5/conf.d/20-xmlrpc.ini
    /etc/php5/conf.d/20-xsl.ini
  )

  default["php"]["confs"] = %w(
    pdo
    curl
    gd
    intl
    mcrypt
    tidy
    xmlrpc
    xsl
    imagick
  )

  default["php"]["service_name"] = "php5-fpm"

  default["php"]["default_app"]["user"] = default["php"]["server"]["user"] = "www-data"
  default["php"]["default_app"]["group"] = default["php"]["server"]["group"] = "www-data"
  default["php"]["default_app"]["dir"] = "/var/www"
when "ubuntu"
  default["php"]["packages"] = %w(
    libgd2-xpm
    php5-fpm
    php5-cli
    php5-curl
    php5-intl
    php5-mcrypt
    php5-xmlrpc
    php5-xsl
    php5-tidy
    php5-gd
    php5-imagick
    php5-dev
    php-pear
  )

  default["php"]["removed_files"] = %w(

  )

  default["php"]["removed_links"] = %w(
    /usr/sbin/php5dismod
    /etc/php5/conf.d/10-pdo.ini
    /etc/php5/conf.d/20-curl.ini
    /etc/php5/conf.d/20-gd.ini
    /etc/php5/conf.d/20-intl.ini
    /etc/php5/conf.d/20-mcrypt.ini
    /etc/php5/conf.d/20-tidy.ini
    /etc/php5/conf.d/20-xmlrpc.ini
    /etc/php5/conf.d/20-xsl.ini
  )

  default["php"]["confs"] = %w(
    pdo
    curl
    gd
    intl
    mcrypt
    tidy
    xmlrpc
    xsl
    imagick
  )

  default["php"]["service_name"] = "php5-fpm"

  default["php"]["default_app"]["user"] = default["php"]["server"]["user"] = "www-data"
  default["php"]["default_app"]["group"] = default["php"]["server"]["group"] = "www-data"
  default["php"]["default_app"]["dir"] = "/var/www"
when "suse"
  default["php"]["packages"] = %w(
    php5-fpm
    php5-curl
    php5-intl
    php5-mcrypt
    php5-xmlrpc
    php5-xsl
    php5-tidy
    php5-gd
    php5-pear
    php5-devel
  )

  default["php"]["removed_files"] = %w(
    /etc/php5/fpm/php-fpm.conf.default
  )

  default["php"]["removed_links"] = %w(

  )

  default["php"]["confs"] = %w(
    ctype
    curl
    dom
    gd
    iconv
    intl
    json
    mcrypt
    pdo
    tidy
    tokenizer
    xmlreader
    xmlrpc
    xmlwriter
    xsl
    zlib
  )

  default["php"]["service_name"] = "php-fpm"

  default["php"]["default_app"]["user"] = default["php"]["server"]["user"] = "wwwrun"
  default["php"]["default_app"]["group"] = default["php"]["server"]["group"] = "www"
  default["php"]["default_app"]["dir"] = "/srv/www/htdocs"
end

default["php"]["removed_dirs"] = %w(

)

default["php"]["create_dirs"] = %w(
  /etc/php5/conf.d
  /etc/php5/mods-available
  /etc/php5/fpm/pool.d
)

default["php"]["create_symlinks"] = {
  "/etc/php5/cli/conf.d" => "/etc/php5/conf.d",
  "/etc/php5/fpm/conf.d" => "/etc/php5/conf.d"
}

default["php"]["config_file"] = "/etc/php5/fpm/php-fpm.conf"
default["php"]["log_dir"] = "/var/log/php5-fpm"
default["php"]["run_dir"] = "/var/run/php5-fpm"
default["php"]["pool_dir"] = "/etc/php5/fpm/pool.d"
default["php"]["confs_dir"] = "/etc/php5/conf.d"

default["php"]["cli"]["config_file"] = "/etc/php5/cli/php.ini"
default["php"]["cli"]["max_execution_time"] = 60
default["php"]["cli"]["memory_limit"] = "-1"
default["php"]["cli"]["display_errors"] = false
default["php"]["cli"]["display_startup_errors"] = false
default["php"]["cli"]["post_max_size"] = "128M"
default["php"]["cli"]["upload_max_filesize"] = "128M"
default["php"]["cli"]["fix_pathinfo"] = "1"

default["php"]["www"]["config_file"] = "/etc/php5/fpm/php.ini" 
default["php"]["www"]["max_execution_time"] = 0
default["php"]["www"]["memory_limit"] = "2048M"
default["php"]["www"]["display_errors"] = false
default["php"]["www"]["display_startup_errors"] = false
default["php"]["www"]["post_max_size"] = "128M"
default["php"]["www"]["upload_max_filesize"] = "128M"
default["php"]["www"]["fix_pathinfo"] = "0"

default["php"]["default_app"]["enabled"] = true

case
when node.recipe?("nginx")
  default["php"]["default_app"]["user"] = node["nginx"]["user"]
  default["php"]["default_app"]["group"] = node["nginx"]["group"]
  default["php"]["default_app"]["dir"] = node["nginx"]["web_dir"]

  default["php"]["server"]["user"] = node["nginx"]["user"]
  default["php"]["server"]["group"] = node["nginx"]["group"]
end
