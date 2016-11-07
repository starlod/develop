#
# Cookbook Name:: site-user
# Recipe:: vim
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# vim設定
# users = node[:authorization][:sudo][:users]

package "vim" do
  action [:install, :upgrade]
end

node[:authorization][:sudo][:users].each do |user|
  home = node[:etc][:passwd][user][:dir]
  bashrc = home + "/.bashrc"

  template "#{home}/.vimrc"
end
