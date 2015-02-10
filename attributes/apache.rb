#
# Cookbook Name:: php
# Attributes:: apache
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

default["php"]["apache"]["enabled"] = node.recipes.include?("apache")

default["php"]["apache"]["packages"] = value_for_platform_family(
  "debian" => %w(
    libapache2-mod-php5
  ),
  "suse" => %w(
    apache2-mod_php5
  )
)

default["php"]["apache"]["removed_files"] = %w()
default["php"]["apache"]["removed_links"] = %w()
default["php"]["apache"]["removed_dirs"] = %w()

default["php"]["apache"]["create_dirs"] = %w(

)

default["php"]["apache"]["create_symlinks"] = {
  "/etc/php5/apache2/conf.d" => "/etc/php5/conf.d"
}

default["php"]["apache"]["www"]["config_file"] = "/etc/php5/apache2/php.ini"
default["php"]["apache"]["www"]["max_execution_time"] = 0
default["php"]["apache"]["www"]["memory_limit"] = "2048M"
default["php"]["apache"]["www"]["display_errors"] = false
default["php"]["apache"]["www"]["display_startup_errors"] = false
default["php"]["apache"]["www"]["post_max_size"] = "128M"
default["php"]["apache"]["www"]["upload_max_filesize"] = "128M"
default["php"]["apache"]["www"]["fix_pathinfo"] = "0"

default["php"]["apache"]["service_name"] = value_for_platform_family(
  "debian" => "apache2",
  "suse" => "apache2"
)
