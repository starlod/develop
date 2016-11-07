#
# Cookbook Name:: site-user
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:authorization][:sudo][:users].each do |user|
  user_account user do
    action :create
    ssh_keys ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBdIQPtr0vLDOuEEo20mTwKImJ1EKY4MG2S76fEFuESgxI38IezSYTZDgbHB9RWuaEA28tmAxQZGmJjX5zI9C907Fa+mv4QqJQTgojEZ4DRqDIAD0x3vYj64jR4l/3VUbjWnp5omzjHAi6dM636Vm6Rv55bPQiI5FlECgnK/PhrADx5Wtrz45rAYPd+Y0UwdAKoEYUu9/7oA/N9VCs5Vokz9M/3Sug4ZqBbPIFqpKT1E5FdQhg+o/bQnOxRXv2n1z5ntX9Bjz/TjThkodES5pBmE27iHSjTtu/W/T4tIPxrtMVjNUp8+sKAvEPh0zTckVCH7+lLxiQelEKlCTByHRz yuki@caffe-latte.local"]   #=> cat ~/.ssh/id_rsa.pubを実行して出てくる文字列
  end
end

include_recipe "sudo::default"
include_recipe "openssh::default"
