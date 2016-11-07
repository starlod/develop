#
# Cookbook Name:: ruby23
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

# 開発ツール(Rails, passenger)
%W{ ruby-devel zlib-devel libcurl-devel apr-devel apr-util-devel gcc libxml2 libxslt }.each do |pkg|
  package pkg do
    action [ :install, :upgrade ]
  end
end

ark "libiconv" do
  url "http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz"
  version "1.14"

  action :install
end
# iconv --version

# Ruby & gem install
node[:ruby][:versions].each { |v|
  # 指定バージョンのrubyをインストール
  rbenv_ruby v["version"] do
    ruby_version v["version"]
    global true if v["global"]
  end

  # gem
  %w[
    bundler
    passenger
  ].each do |pkg|
    rbenv_gem pkg do
      ruby_version v["version"]
    end
  end
}

# passenger
conf_path = "/etc/httpd/conf.d/passenger.conf"
execute "passenger_module" do
  user "root"
  command <<-EOH
    passenger-install-apache2-module --auto
    echo LoadModule passenger_module `passenger-config --root`/buildout/apache2/mod_passenger.so >> #{conf_path}
    echo PassengerRoot `passenger-config --root` >> #{conf_path}
    echo PassengerDefaultRuby `rbenv which ruby` >> #{conf_path}
  EOH
  action :run
  notifies :reload, 'service[httpd]'
  not_if { File.exists?(conf_path) }
end

# Rails Virtualhost
# template "/etc/httpd/conf.d/httpd.rails.conf" do
#   notifies :start, 'service[httpd]'
#   notifies :restart, 'service[httpd]'
# end

### rbenv コマンド

# rbenv -h
# rbenv -v
# rbenv versions
# rbenv version
# rbenv install -l
# gem environment
# gem list
