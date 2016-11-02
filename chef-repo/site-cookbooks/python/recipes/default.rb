#
# Cookbook Name:: pyenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# gitコマンドがなければインストール
package "git" do
  not_if "which git"
end

# 依存パッケージのインストール
node[:pyenv][:depend_packages].each do |pkg|
  package pkg
end

#
# pyenvをclone
#
git node[:pyenv][:root_path] do
    repository node[:pyenv][:git_repository]
end

# pyenvユーザー作成
user node[:pyenv][:user] do
  shell "/bin/bash"
  home node[:pyenv][:root_path]
end

#
# clone先ディレクトリの権限変更
#
directory node[:pyenv][:root_path] do
  owner node[:pyenv][:user]
  group node[:pyenv][:group]
  mode "2775"
  recursive true

  notifies :run, "execute[fixup #{node[:pyenv][:root_path]} owner]", :immediately
end

execute "fixup #{node[:pyenv][:root_path]} owner" do
  command "chown -Rf #{node[:pyenv][:user]}:#{node[:pyenv][:group]} #{node[:pyenv][:root_path]}"
  action :nothing
end

#
# profile.dにpyenvのパス設定ファイルを置く
#
template "/etc/profile.d/pyenv.sh" do
  source "pyenv.sh.erb"
  mode "0644"
  variables(
    :pyenv_root => node[:pyenv][:root_path],
  )
end

# rbenvは/etc/profile.d/rbenv.shにあるpyenv initを実行することで、
# フォルダを作成する、その際権限がないユーザが実行する際、作成に失敗することがある
# なのであらかじめ作成しておく(rbenv cookbookと同じ)
%w{shims versions}.each do |dir_name|
  directory "#{node[:pyenv][:root_path]}/#{dir_name}" do
    owner node[:pyenv][:user]
    group node[:pyenv][:group]
    mode "2775"
    action :create
  end
end

#
# install python
#
bash "setup pyenv" do
  user node[:pyenv][:user]
  group node[:pyenv][:group]
  code <<-EOC
    pyenv install #{node[:pyenv][:install_version]}
    pyenv global #{node[:pyenv][:install_version]}
    pyenv rehash
  EOC
  environment ({'PYENV_ROOT' => "#{node[:pyenv][:root_path]}", 'PATH' => "#{node[:pyenv][:root_path]}/bin:#{ENV['PATH']}"})

  not_if { File.directory?("#{node[:pyenv][:root_path]}/versions/#{node[:pyenv][:install_version]}") }
end

#
# install packages
#
node[:pyenv][:install_packages].each do |pkg|
  bash "Install packages" do
    user node[:pyenv][:user]
    group node[:pyenv][:group]
    command <<-EOH
      pip install #{pkg}
    EOH
  end
end
