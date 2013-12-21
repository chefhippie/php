#
# Cookbook Name:: php
# Attributes:: postgresql
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
  default["php"]["postgresql"]["packages"] = %w(
    php5-pgsql
  )

  default["php"]["postgresql"]["confs"] = %w(
    pdo_pgsql
    pgsql
  )

  default["php"]["postgresql"]["removed_links"] = %w(
    /etc/php5/conf.d/20-pdo_pgsql.ini
    /etc/php5/conf.d/20-pgsql.ini
  )
when "ubuntu"
  default["php"]["postgresql"]["packages"] = %w(
    php5-pgsql
  )

  default["php"]["postgresql"]["confs"] = %w(
    pdo_pgsql
    pgsql
  )

  default["php"]["postgresql"]["removed_links"] = %w(
    /etc/php5/conf.d/20-pdo_pgsql.ini
    /etc/php5/conf.d/20-pgsql.ini
  )
when "suse"
  default["php"]["postgresql"]["packages"] = %w(
    php5-pgsql
  )

  default["php"]["postgresql"]["confs"] = %w(
    pdo_pgsql
    pgsql
  )

  default["php"]["postgresql"]["removed_links"] = %w(

  )
end
