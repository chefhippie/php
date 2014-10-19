#
# Cookbook Name:: php
# Attributes:: zlib
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
  default["php"]["zlib"]["packages"] = %w(
    php5-zlib
  )

  default["php"]["zlib"]["confs"] = %w(
    zlib
  )

  default["php"]["zlib"]["removed_links"] = %w(
    /etc/php5/conf.d/20-zlib.ini
  )

  default["php"]["zlib"]["removed_files"] = %w(
    /etc/php5/mods-available/zlib.ini
  )
when "suse"
  default["php"]["zlib"]["packages"] = %w(
    php5-zlib
  )

  default["php"]["zlib"]["confs"] = %w(
    zlib
  )

  default["php"]["zlib"]["removed_links"] = %w(

  )

  default["php"]["zlib"]["removed_files"] = %w(

  )
end