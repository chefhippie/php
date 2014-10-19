#
# Cookbook Name:: php
# Attributes:: memcached
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
  default["php"]["memcached"]["packages"] = %w(
    php5-memcached
  )

  default["php"]["memcached"]["confs"] = %w(
    memcached
  )

  default["php"]["memcached"]["removed_links"] = %w(
    /etc/php5/conf.d/20-memcached.ini
  )
when "ubuntu"
  default["php"]["memcached"]["packages"] = %w(
    php5-memcached
  )

  default["php"]["memcached"]["confs"] = %w(
    memcached
  )

  default["php"]["memcached"]["removed_links"] = %w(
    /etc/php5/conf.d/20-memcached.ini
  )
when "suse"
  default["php"]["memcached"]["packages"] = %w(

  )

  default["php"]["memcached"]["confs"] = %w(

  )

  default["php"]["memcached"]["removed_links"] = %w(

  )
end
