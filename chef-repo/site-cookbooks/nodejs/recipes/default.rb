#
# Cookbook Name:: nodejs7
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum-epel::default"

package "nodejs" do
  action [ :install, :upgrade ]
end

node[:nodejs][:npm_packages].each do |pkg|
  f = nodejs_npm pkg[:name] do
    action :nothing
  end
  pkg.each do |key, value|
    f.send(key, value) unless key == "name" || key == "action"
  end
  action = pkg.key?("action") ? pkg[:action] : :install
  f.action(action)
end if node[:nodejs].key?("npm_packages")

# {
#   "/usr/local/bin/npm-check-updates" => "/usr/bin/npm-check-updates",
#   "/usr/local/bin/tsc" => "/usr/bin/tsc",
# }.each do |local, global|
#   link global do
#     to local
#     not_if { File.exists?(global) }
#   end
# end
