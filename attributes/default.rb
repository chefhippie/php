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

default["php"]["type"] = "fpm"

case node["platform_family"]
when "debian"
  default["php"]["packages"] = %w(
    libgd2-xpm
    php5-cli
    php5-dev
    php-pear
  )

  default["php"]["removed_files"] = %w(
    /usr/sbin/php5enmod
    /etc/php5/mods-available/curl.ini
    /etc/php5/mods-available/gd.ini
    /etc/php5/mods-available/intl.ini
    /etc/php5/mods-available/mcrypt.ini
    /etc/php5/mods-available/tidy.ini
    /etc/php5/mods-available/xmlrpc.ini
    /etc/php5/mods-available/xsl.ini
  )

  default["php"]["removed_links"] = %w(
    /usr/sbin/php5dismod
    /etc/php5/conf.d/20-curl.ini
    /etc/php5/conf.d/20-gd.ini
    /etc/php5/conf.d/20-intl.ini
    /etc/php5/conf.d/20-mcrypt.ini
    /etc/php5/conf.d/20-tidy.ini
    /etc/php5/conf.d/20-xmlrpc.ini
    /etc/php5/conf.d/20-xsl.ini
  )

  default["php"]["confs"] = %w(

  )

  default["php"]["default_app"]["user"] = default["php"]["server"]["user"] = "www-data"
  default["php"]["default_app"]["group"] = default["php"]["server"]["group"] = "www-data"
  default["php"]["default_app"]["service"] = default["php"]["server"]["service"] = "nginx"
  default["php"]["default_app"]["dir"] = "/var/www"
when "ubuntu"
  default["php"]["packages"] = %w(
    libgd2-xpm
    php5-cli
    php5-dev
    php-pear
  )

  default["php"]["removed_files"] = %w(

  )

  default["php"]["removed_links"] = %w(
    /usr/sbin/php5dismod
    /etc/php5/conf.d/20-curl.ini
    /etc/php5/conf.d/20-gd.ini
    /etc/php5/conf.d/20-intl.ini
    /etc/php5/conf.d/20-mcrypt.ini
    /etc/php5/conf.d/20-tidy.ini
    /etc/php5/conf.d/20-xmlrpc.ini
    /etc/php5/conf.d/20-xsl.ini
  )

  default["php"]["confs"] = %w(

  )

  default["php"]["default_app"]["user"] = default["php"]["server"]["user"] = "www-data"
  default["php"]["default_app"]["group"] = default["php"]["server"]["group"] = "www-data"
  default["php"]["default_app"]["service"] = default["php"]["server"]["service"] = "nginx"
  default["php"]["default_app"]["dir"] = "/var/www"
when "suse"
  default["php"]["packages"] = %w(
    php5-pear
    php5-devel
  )

  default["php"]["removed_files"] = %w(
    /etc/php5/fpm/php-fpm.conf.default
  )

  default["php"]["removed_links"] = %w(

  )

  default["php"]["confs"] = %w(

  )

  default["php"]["default_app"]["user"] = default["php"]["server"]["user"] = "wwwrun"
  default["php"]["default_app"]["group"] = default["php"]["server"]["group"] = "www"
  default["php"]["default_app"]["service"] = default["php"]["server"]["service"] = "nginx"
  default["php"]["default_app"]["dir"] = "/srv/www/htdocs"
end

default["php"]["modules"] = %w(
  bcmath
  ctype
  dom
  gettext
  iconv
  imagick
  json
  ldap
  mbstring
  openssl
  posix
  sqlite
  tokenizer
  xmlreader
  xmlwriter
  zlib
  curl
  intl
  mcrypt
  xmlrpc
  xsl
  tidy
  gd
)

default["php"]["removed_dirs"] = %w(

)

default["php"]["create_dirs"] = %w(
  /etc/php5/conf.d
  /etc/php5/mods-available
)

default["php"]["create_symlinks"] = {
  "/etc/php5/cli/conf.d" => "/etc/php5/conf.d"
}

default["php"]["confs_dir"] = "/etc/php5/conf.d"

default["php"]["cli"]["config_file"] = "/etc/php5/cli/php.ini"
default["php"]["cli"]["max_execution_time"] = 60
default["php"]["cli"]["memory_limit"] = "-1"
default["php"]["cli"]["display_errors"] = false
default["php"]["cli"]["display_startup_errors"] = false
default["php"]["cli"]["post_max_size"] = "128M"
default["php"]["cli"]["upload_max_filesize"] = "128M"
default["php"]["cli"]["fix_pathinfo"] = "1"

case node["php"]["type"]
when "fpm"
  default["php"]["config_file"] = "/etc/php5/fpm/php-fpm.conf"
  default["php"]["pool_dir"] = "/etc/php5/fpm/pool.d"
  default["php"]["log_dir"] = "/var/log/php5-fpm"
  default["php"]["run_dir"] = "/var/run/php5-fpm"

  default["php"]["default_app"]["enabled"] = true

  default["php"]["www"]["config_file"] = "/etc/php5/fpm/php.ini" 
  default["php"]["www"]["max_execution_time"] = 0
  default["php"]["www"]["memory_limit"] = "2048M"
  default["php"]["www"]["display_errors"] = false
  default["php"]["www"]["display_startup_errors"] = false
  default["php"]["www"]["post_max_size"] = "128M"
  default["php"]["www"]["upload_max_filesize"] = "128M"
  default["php"]["www"]["fix_pathinfo"] = "0"

  default["php"]["create_symlinks"]["/etc/php5/fpm/conf.d"] = "/etc/php5/conf.d"

  default["php"]["service_name"] = value_for_platform_family(
    "debian" => "php5-fpm",
    "ubuntu" => "php5-fpm",
    "suse" => "php-fpm"
  )

  default["php"]["packages"].unshift *value_for_platform_family(
    "debian" => %w(php5-fpm),
    "ubuntu" => %w(php5-fpm),
    "suse" => %w(php5-fpm)
  )

  default["php"]["create_dirs"].push "/etc/php5/fpm/pool.d"
when "apache"
  default["php"]["default_app"]["enabled"] = false

  default["php"]["www"]["config_file"] = "/etc/php5/apache2/php.ini" 
  default["php"]["www"]["max_execution_time"] = 0
  default["php"]["www"]["memory_limit"] = "2048M"
  default["php"]["www"]["display_errors"] = false
  default["php"]["www"]["display_startup_errors"] = false
  default["php"]["www"]["post_max_size"] = "128M"
  default["php"]["www"]["upload_max_filesize"] = "128M"
  default["php"]["www"]["fix_pathinfo"] = "0"

  default["php"]["create_symlinks"]["/etc/php5/apache2/conf.d"] = "/etc/php5/conf.d"

  default["php"]["service_name"] = value_for_platform_family(
    "debian" => "apache2",
    "ubuntu" => "apache2",
    "suse" => "apache2"
  )

  default["php"]["packages"].unshift *value_for_platform_family(
    "debian" => %w(libapache2-mod-php5),
    "ubuntu" => %w(libapache2-mod-php5),
    "suse" => %w(apache2-mod_php5)
  )
end

case
when node.recipes.include?("apache")
  default["php"]["default_app"]["user"] = node["apache"]["user"]
  default["php"]["default_app"]["group"] = node["apache"]["group"]
  default["php"]["default_app"]["dir"] = node["apache"]["web_dir"]

  default["php"]["server"]["user"] = node["apache"]["user"]
  default["php"]["server"]["group"] = node["apache"]["group"]
  default["php"]["server"]["service"] = "apache2"
when node.recipes.include?("nginx")
  default["php"]["default_app"]["user"] = node["nginx"]["user"]
  default["php"]["default_app"]["group"] = node["nginx"]["group"]
  default["php"]["default_app"]["dir"] = node["nginx"]["web_dir"]

  default["php"]["server"]["user"] = node["nginx"]["user"]
  default["php"]["server"]["group"] = node["nginx"]["group"]
  default["php"]["server"]["service"] = "nginx"
end

default["php"]["zypper"]["enabled"] = true
default["php"]["zypper"]["alias"] = "php-extensions"
default["php"]["zypper"]["title"] = "PHP Extensions"
default["php"]["zypper"]["repo"] = "http://download.opensuse.org/repositories/server:/php:/extensions/openSUSE_#{node["platform_version"]}/"
default["php"]["zypper"]["key"] = "#{node["php"]["zypper"]["repo"]}repodata/repomd.xml.key"
