#! /bin/sh -x

# 共有フォルダをドキュメントルートにしているため、vagrant up時マウントされてなくてコケるため、Apacheを再起動させる。
httpd -t
sudo systemctl restart httpd

# ステータス
sudo systemctl status httpd
sudo systemctl status mysql-default

# ファイアウォール
firewall-cmd --list-all --zone=public

# NTPサーバーへの時刻同期状態確認
ntpq -p

# バージョン表示
cat /etc/redhat-release
php -v
composer -V
mysql -V
httpd -v
rbenv -v
ruby -v
rails -v
passenger-config --version
node -v
npm -v
gulp -v
phantomjs -v
python -V
