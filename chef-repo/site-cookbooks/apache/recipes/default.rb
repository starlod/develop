#
# Cookbook Name:: httpd24
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum::default"
include_recipe "yum-ius::default"

%W[
  httpd
  httpd-devel
  httpd-manual
].each do |pkg|
  package pkg do
    action [ :install, :upgrade ]
    options "--enablerepo=ius"
  end
end

service "httpd" do
  action [:start, :enable]
  supports :start => true, :status => true, :restart => true, :reload => true
end

template "/etc/httpd/conf/httpd.conf" do
  notifies :reload, "service[httpd]"
end
