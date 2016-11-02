#
# Cookbook Name:: mysql57
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum-mysql-community::mysql57"

# mariadbは不要
%W{ mariadb-libs }.each do |pkg|
  package pkg do
    action :remove
  end
end

# mysql2を入れるために必須
%W{ mysql-devel }.each do |pkg|
  package pkg do
    action [ :install, :upgrade ]
    options "--enablerepo=mysql57-community"
  end
end

# MySQL用のプロバイダー
# https://docs.chef.io/resource_chef_gem.html
# http://www.creationline.com/lab/7833
chef_gem 'mysql2' do
  compile_time false if respond_to?(:compile_time)
end

# MySQL server
mysql_service 'default' do
  version node['mysql']['version']
  package_version node['mysql']['package_version']
  port node['mysql']['port']
  initial_root_password node['mysql']['initial_root_password']
  action [:create, :start]
end

# MySQL client
mysql_client 'default' do
  version node['mysql']['version']
  package_version node['mysql']['package_version']
  action :create
end

# MySQL接続情報
mysql_connection_info = {
  host: 'localhost',
  username: 'root',
  socket: '/var/run/mysql-default/mysqld.sock',
  password: node['mysql']['initial_root_password']
}

# データベース作成
node['mysql']['databases'].each do |database|
  mysql_database database do
    connection mysql_connection_info
    action :create
  end
end

# ユーザー追加
node['mysql']['users'].each do |user|
  user["databases"].each do |database|
    mysql_database_user user["username"] do
      connection mysql_connection_info
      database_name database
      password user["password"]
      privileges [:all]
      action [:create, :grant]
    end
  end
end

# template "/etc/my.cnf" do
#   notifies :restart, "service[mysqld]"
# end
