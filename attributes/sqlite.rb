#
# Cookbook Name:: php
# Attributes:: sqlite
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
  default["php"]["sqlite"]["packages"] = %w(
    php5-sqlite
  )

  default["php"]["sqlite"]["confs"] = %w(
    pdo
    pdo_sqlite
    sqlite3
  )

  default["php"]["sqlite"]["removed_links"] = %w(
    /etc/php5/conf.d/10-pdo.ini
    /etc/php5/conf.d/20-pdo_sqlite.ini
    /etc/php5/conf.d/20-sqlite3.ini
  )

  default["php"]["sqlite"]["removed_files"] = %w(
    /etc/php5/mods-available/pdo.ini
  )
when "suse"
  default["php"]["sqlite"]["packages"] = %w(
    php5-pdo
    php5-sqlite
  )

  default["php"]["sqlite"]["confs"] = %w(
    pdo
    pdo_sqlite
    sqlite3
  )

  default["php"]["sqlite"]["removed_links"] = %w(

  )

  default["php"]["sqlite"]["removed_files"] = %w(

  )
end
