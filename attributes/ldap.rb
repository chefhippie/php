#
# Cookbook Name:: php
# Attributes:: ldap
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
when "debian", "ubuntu"
  default["php"]["ldap"]["packages"] = %w(
    php5-ldap
  )

  default["php"]["ldap"]["confs"] = %w(
    ldap
  )

  default["php"]["ldap"]["removed_links"] = %w(
    /etc/php5/conf.d/20-ldap.ini
  )

  default["php"]["ldap"]["removed_files"] = %w(
    /etc/php5/mods-available/ldap.ini
  )
when "suse"
  default["php"]["ldap"]["packages"] = %w(
    php5-ldap
  )

  default["php"]["ldap"]["confs"] = %w(
    ldap
  )

  default["php"]["ldap"]["removed_links"] = %w(

  )

  default["php"]["ldap"]["removed_files"] = %w(

  )
end