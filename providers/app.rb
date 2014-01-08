#
# Cookbook Name:: php
# Provider:: app
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

require "chef/dsl/include_recipe"
include Chef::DSL::IncludeRecipe

action :create do
  group new_resource.group do
    append true
    members [new_resource.listen_user || node["php"]["server"]["user"]]

    action :manage
    notifies :restart, "service[#{node["php"]["server"]["service"]}]"
  end

  template ::File.join(node["php"]["pool_dir"], "#{new_resource.alias}.conf") do
    cookbook "php"
    source "pool.conf.erb"

    mode 0644
    owner "root"
    group "root"

    variables(
      node["php"].merge({
        "listen_user" => new_resource.listen_user || node["php"]["server"]["user"],
        "listen_group" => new_resource.listen_group || node["php"]["server"]["group"],

        "alias" => new_resource.alias,
        "user" => new_resource.user,
        "group" => new_resource.group,

        "admin_flags" => new_resource.admin_flags,
        "admin_values" => new_resource.admin_values,
        "php_flags" => new_resource.php_flags,
        "php_values" => new_resource.php_values
      })
    )

    notifies :restart, "service[php]"
  end

  new_resource.updated_by_last_action(true)
end

action :delete do
  file ::File.join(node["php"]["pool_dir"], "#{new_resource.alias}.conf") do
    action :delete
    notifies :restart, "service[php]"
  end

  new_resource.updated_by_last_action(true)
end
