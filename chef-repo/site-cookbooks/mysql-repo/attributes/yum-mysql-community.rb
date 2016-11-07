include_attribute "yum-mysql-community::mysql57-community"

default[:yum]["mysql57-community"][:repositoryid] = "mysql57-community"
default[:yum]["mysql57-community"][:description] = "MySQL 5.7 Community Server"
default[:yum]["mysql57-community"][:gpgkey] = "https://raw.githubusercontent.com/chef-cookbooks/yum-mysql-community/master/files/default/mysql_pubkey.asc"
