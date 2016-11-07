#
# Cookbook Name:: site-user
# Recipe:: alias
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log node[:authorization][:sudo][:users]
log node[:current_user]

# alias設定
# users = node[:authorization][:sudo][:users]

node[:authorization][:sudo][:users].each do |user|
  home = node[:etc][:passwd][user][:dir]
  bashrc = home + "/.bashrc"

  [
    "alias ll='ls -lh'",
    "alias la='ls -alh'",
    "alias vi='vim'",
    # Symfony
    "alias dev='php bin/console --env=dev'",
    "alias prod='php bin/console --env=prod'",
    # Git
    "alias gb='git branch'",
    "alias gc='git checkout'",
    "alias gcb='git checkout -b'",
    "alias gs='git status'",
    "alias gcm='git checkout master'",
    "alias gpom='git pull origin master'",
    "alias gmm='git merge master'",
  ].each do |cmd|
    cmd.gsub!("'", "\\\\'") # シングルクォーテーションのエスケープ

    bash "alias_config" do
      code <<-EOS
        echo #{cmd} >> #{bashrc}
      EOS
      not_if "grep #{cmd} #{bashrc}"
    end
  end
end
