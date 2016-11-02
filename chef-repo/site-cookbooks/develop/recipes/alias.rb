#
# Cookbook Name:: develop
# Recipe:: alias
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# alias設定
home = "/home/vagrant"
bashrc = home + "/.bashrc"

[
  "alias ll='ls -lh --time-style=long-iso'",
  "alias la='ls -alh --time-style=long-iso'",
  "alias vi='vim'",
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
