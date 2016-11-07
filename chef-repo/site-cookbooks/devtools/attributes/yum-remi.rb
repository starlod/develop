include_attribute "yum-remi::default"

default[:yum]["remi-php71"][:repositoryid] = "remi-php71"
default[:yum]["remi-php71"][:baseurl] = "http://rpms.famillecollet.com/enterprise/7/php71/x86_64/"
default[:yum]["remi-php71"][:description] = "Les RPM de remi de PHP 7 pour Enterprise Linux 7 - $basearch"
default[:yum]["remi-php71"][:mirrorlist] = "http://rpms.famillecollet.com/enterprise/7/php71/mirror"
default["yum-remi"][:repositories] = ["remi","remi-php71"]
