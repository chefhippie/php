#
# Cookbook Name:: php
# Recipe:: fpm
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

node["php"]["fpm"]["packages"].each do |name|
  package name do
    action :install
  end
end

node["php"]["fpm"]["removed_files"].each do |name|
  file name do
    action :delete

    only_if do
      File.exists? name
    end
  end
end

node["php"]["fpm"]["removed_links"].each do |name|
  link name do
    action :delete

    only_if do
      File.symlink? name
    end
  end
end

node["php"]["fpm"]["removed_dirs"].each do |name|
  directory name do
    action :delete
    recursive true

    only_if do
      File.directory? name
    end
  end
end

node["php"]["fpm"]["create_dirs"].each do |name|
  directory name do
    action :create
    recursive true

    owner "root"
    group "root"
    mode 0755
  end
end

node["php"]["fpm"]["create_symlinks"].each do |source, destination|
  link source do
    to destination
  end
end

directory node["php"]["fpm"]["log_dir"].to_s do
  owner "root"
  group "root"
  mode 0640

  action :create
end

directory node["php"]["fpm"]["run_dir"].to_s do
  owner node["php"]["server"]["user"]
  group node["php"]["server"]["group"]
  mode 0750

  action :create
end

template node["php"]["fpm"]["config_file"].to_s do
  source "php-fpm.conf.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["php"]["fpm"]
  )

  notifies :restart, "service[php]"
end

template node["php"]["fpm"]["www"]["config_file"] do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["php"]["fpm"]["www"]
  )

  notifies :restart, "service[php]"
end

php_app "www" do
  chdir node["php"]["fpm"]["default"]["dir"]
  user node["php"]["fpm"]["default"]["user"]
  group node["php"]["fpm"]["default"]["group"]

  only_if do
    node["php"]["fpm"]["default"]["enabled"]
  end
end

service "php" do
  service_name node["php"]["fpm"]["service_name"]
  action [:enable, :start]
end
