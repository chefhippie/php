#
# Cookbook Name:: php
# Attributes:: ctype
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
  default["php"]["ctype"]["packages"] = %w(
    php5-ctype
  )

  default["php"]["ctype"]["confs"] = %w(
    ctype
  )

  default["php"]["ctype"]["removed_links"] = %w(
    /etc/php5/conf.d/20-ctype.ini
  )

  default["php"]["ctype"]["removed_files"] = %w(
    /etc/php5/mods-available/ctype.ini
  )
when "suse"
  default["php"]["ctype"]["packages"] = %w(
    php5-ctype
  )

  default["php"]["ctype"]["confs"] = %w(
    ctype
  )

  default["php"]["ctype"]["removed_links"] = %w(

  )

  default["php"]["ctype"]["removed_files"] = %w(

  )
end