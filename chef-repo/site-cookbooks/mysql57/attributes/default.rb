default['mysql']['version'] = "5.7"
default['mysql']['package_version'] = "5.7.16-1.el7"
default['mysql']['port'] = "3306"
default['mysql']['initial_root_password'] = "Network7932!"
default['mysql']['databases'] = [
  "symfony_dev",
  "symfony_test",
  "symfony_prod",
  "laravel_dev",
  "laravel_test",
  "laravel_prod",
]
default['mysql']['users'] = [
  {
    "username": "symfony",
    "password": "Network7932!",
    "databases": [
      "symfony_dev",
      "symfony_test",
      "symfony_prod",
    ]
  },
  {
    "username": "laravel",
    "password": "Network7932!",
    "databases": [
      "laravel_dev",
      "laravel_test",
      "laravel_prod",
    ]
  },
]
