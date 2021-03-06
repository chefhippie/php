#
# Cookbook Name:: php
# Recipe:: sqlite
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

node["php"]["sqlite"]["packages"].each do |name|
  package name do
    action :install
  end
end

node["php"]["sqlite"]["removed_files"].each do |name|
  file name do
    action :delete

    only_if do
      File.exists? name
    end
  end
end

node["php"]["sqlite"]["removed_links"].each do |name|
  link name do
    action :delete

    only_if do
      File.symlink? name
    end
  end
end

node["php"]["sqlite"]["confs"].each do |name|
  php_conf name do
    template "confs/#{name}.ini.erb"
    variables node["php"]

    action :create
  end
end
