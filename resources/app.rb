#
# Cookbook Name:: php
# Resource:: app
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

actions :create, :delete

attribute :alias, :kind_of => String, :name_attribute => true
attribute :chdir, :kind_of => String, :default => "/"
attribute :user, :kind_of => String, :default => nil
attribute :group, :kind_of => String, :default => nil
attribute :listen_user, :kind_of => String, :default => nil
attribute :listen_group, :kind_of => String, :default => nil
attribute :admin_flags, :kind_of => Hash, :default => {}
attribute :admin_values, :kind_of => Hash, :default => {}
attribute :php_flags, :kind_of => Hash, :default => {}
attribute :php_values, :kind_of => Hash, :default => {}

default_action :create
