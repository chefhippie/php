#
# Cookbook Name:: php
# Recipe:: default
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
when "suse"
  include_recipe "zypper"

  zypper_repository node["php"]["zypper"]["alias"] do
    uri node["php"]["zypper"]["repo"]
    key node["php"]["zypper"]["key"]
    title node["php"]["zypper"]["title"]

    action [:add, :refresh]

    only_if do
      node["php"]["zypper"]["enabled"]
    end
  end
end

node["php"]["packages"].each do |name|
  package name do
    action :install
  end
end

node["php"]["removed_files"].each do |name|
  file name do
    action :delete

    only_if do
      File.exists? name
    end
  end
end

node["php"]["removed_links"].each do |name|
  link name do
    action :delete

    only_if do
      File.symlink? name
    end
  end
end

node["php"]["removed_dirs"].each do |name|
  directory name do
    action :delete
    recursive true

    only_if do
      File.directory? name
    end
  end
end

node["php"]["create_dirs"].each do |name|
  directory name do
    action :create
    recursive true

    owner "root"
    group "root"
    mode 0755
  end
end

node["php"]["create_symlinks"].each do |source, destination|
  link source do
    to destination
  end
end

template node["php"]["cli"]["config_file"] do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["php"]["cli"]
  )
end

file "/usr/sbin/php5enmod" do
  owner "root"
  group "root"
  mode 0755

  content ""
end

file "/usr/sbin/php5dismod" do
  owner "root"
  group "root"
  mode 0755

  content ""
end

include_recipe "php::modules"

include_recipe "php::memcached" if node.recipes.include?("memcached")
include_recipe "php::mysql" if node.recipes.include?("mysql")
include_recipe "php::postgresql" if node.recipes.include?("postgresql")
include_recipe "php::sqlite" if node.recipes.include?("sqlite")

include_recipe "php::fpm" if node["php"]["fpm"]["enabled"]
include_recipe "php::apache" if node["php"]["apache"]["enabled"]
