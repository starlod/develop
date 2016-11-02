include_attribute 'firewalld::default'

default['firewall']['services'] = ["ssh", "ntp", "http", "https"]
default['firewall']['ports'] = []
