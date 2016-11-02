#
# Cookbook Name:: dev
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/home/vagrant/.vimrc"

include_recipe 'firewalld::enable'
include_recipe 'develop::alias'
