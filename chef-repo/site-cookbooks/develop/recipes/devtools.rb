#
# Cookbook Name:: booking
# Recipe:: mkdir
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# 公開ディレクトリを作成
%w[
  /home/vagrant/laravel
  /home/vagrant/laravel/public
  /home/vagrant/laravel/storage/logs
  /home/vagrant/django
].each do |path|
  directory path do
    owner "vagrant"
    group "vagrant"
    mode 0775
    action :create
    recursive true
    not_if { File.exists?(path) }
  end
end

yum_package "yum-fastestmirror" do
  action :install
end

execute "yum-update" do
  user "root"
  command "yum -y update"
  action :run
end

execute "lang-japanese" do
  user "root"
  command <<-EOH
    localectl set-locale LANG=ja_JP.UTF-8
  EOH
  action :run
end

# 開発者ツール
execute "devtools" do
  user "root"
  command 'yum -y groupinstall "Base" "Development tools" "Japanese Support"'
  action :run
end

# 不要なyumパッケージ
%W[
  mariadb-libs
].each do |pkg|
  package pkg do
    action :remove
  end
end

# yumパッケージ
%W[
  zip
  unzip
  lsof
  pcre
  pcre-devel
  openssl
  openssl-devel
  wget
  curl
  vim
].each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
