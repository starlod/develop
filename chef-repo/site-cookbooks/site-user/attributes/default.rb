include_attribute "sudo::default"

default[:authorization][:sudo][:users] = ["dev"]
default[:authorization][:sudo][:passwordless] = true

default[:openssh][:server][:permit_root_login] = "no"
default[:openssh][:server][:password_authentication] = "no"
