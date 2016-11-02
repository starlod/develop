default[:pyenv][:user]            = "pyenv"
default[:pyenv][:group]           = "pyenv"
default[:pyenv][:git_repository]  = "https://github.com/yyuu/pyenv.git"
default[:pyenv][:install_prefix]  = "/opt"
default[:pyenv][:root_path]       = "#{node[:pyenv][:install_prefix]}/pyenv"
default[:pyenv][:install_version] = "3.5.2"
default[:pyenv][:depend_packages] = ["bzip2-devel"]
default[:pyenv][:install_packages] = ["virtualenv", "django"]
