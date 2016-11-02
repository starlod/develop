include_attribute 'nginx::default'

default['nginx']['port'] = 80

# vagrantの共有フォルダを使っている場合は'off'にする
default["nginx"]["sendfile"] = 'off'
