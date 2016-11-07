#
# Cookbook Name:: php7
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum::default"
include_recipe "yum-remi::default"

%w[
  gd-last
  t1lib
].each do |pkg|
  package pkg do
    action [ :install ]
    options "--enablerepo=remi"
    flush_cache [:before]
  end
end

%w[
  php
  php-cli
  php-common
  php-gd
  php-xml
  php-pdo
  php-mbstring
  php-mysqlnd
  php-opcache
  php-pecl-apcu
  php-devel
  php-fpm
  php-gmp
  php-intl
  php-pear
].each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=remi-php71"
  end
end

service "php-fpm" do
  action [:start, :enable]
end

execute "composer-install" do
  command "curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/bin/composer"
  not_if { File.exists?("/usr/bin/composer")}
end

template "/etc/php.ini"
