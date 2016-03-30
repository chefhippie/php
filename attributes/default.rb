#
# Cookbook Name:: php
# Attributes:: default
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
  )

  default["php"]["removed_links"] = %w(
    /usr/sbin/php5dismod
  )

  default["php"]["create_dirs"] = %w(
    /etc/php5/conf.d
    /etc/php5/mods-available
  )
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

  default["php"]["create_dirs"] = %w(
    /etc/php5/conf.d
  )
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
  /etc/php5/cli/conf.d
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

case node["platform_family"]
when "suse"
  repo = case node["platform_version"]
  when /\A13\.\d+\z/
    "openSUSE_#{node["platform_version"]}"
  when /\A42\.\d+\z/
    "openSUSE_Leap_#{node["platform_version"]}"
  when /\A\d{8}\z/
    "openSUSE_Factory"
  else
    raise "Unsupported SUSE version"
  end

  default["php"]["zypper"]["enabled"] = true
  default["php"]["zypper"]["alias"] = "php-extensions"
  default["php"]["zypper"]["title"] = "PHP Extensions"
  default["php"]["zypper"]["repo"] = "http://download.opensuse.org/repositories/server:/php:/extensions/#{repo}/"
  default["php"]["zypper"]["key"] = "#{node["php"]["zypper"]["repo"]}repodata/repomd.xml.key"
end
