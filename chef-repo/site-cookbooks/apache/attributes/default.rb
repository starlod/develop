default['httpd']['servername'] = "local"
default['httpd']['user'] = "vagrant"
default['httpd']['group'] = "vagrant"
default['httpd']['port'] = 80

# vagrantの共有フォルダを使っている場合は'off'にする
default["httpd"]["EnableMMAP"] = "off"
default["httpd"]["EnableSendfile"] = "off"
