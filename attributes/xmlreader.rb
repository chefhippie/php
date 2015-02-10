#
# Cookbook Name:: php
# Attributes:: xmlreader
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
  default["php"]["xmlreader"]["packages"] = %w(
    php5-xmlreader
  )

  default["php"]["xmlreader"]["confs"] = %w(
    xmlreader
  )

  default["php"]["xmlreader"]["removed_links"] = %w(
    /etc/php5/conf.d/20-xmlreader.ini
  )

  default["php"]["xmlreader"]["removed_files"] = %w(
    /etc/php5/mods-available/xmlreader.ini
  )
when "suse"
  default["php"]["xmlreader"]["packages"] = %w(
    php5-xmlreader
  )

  default["php"]["xmlreader"]["confs"] = %w(
    xmlreader
  )

  default["php"]["xmlreader"]["removed_links"] = %w(

  )

  default["php"]["xmlreader"]["removed_files"] = %w(

  )
end
