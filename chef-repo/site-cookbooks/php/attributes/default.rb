
default["php"]["ini"]["template"] = "php.ini.erb"
default["php"]["ini"]["cookbook"] = "php"
default["php"]["fpm_socket"] = "/var/run/php-fpm/php-fpm.sock"

# レスポンスヘッダに含まれる PHP バージョン情報の表示を制御します。
default["php"]["ini"]["expose_php"] = "Off"
# PHP スクリプトのタイムアウト時間です。0: 無制限
# Apache 側にも Timeout ディレクティブがあるのでそちらも変更する必要があります。
default["php"]["ini"]["max_execution_time"] = 300
# PHP が GET, POST リクエストを解析する際のタイムアウト時間
default["php"]["ini"]["max_input_time"] = 60
# PHP が使用できるメモリの最大数を定義します。
# ファイルアップロードを行う場合、アップロードする最大サイズ post_max_size より大きな値を指定するのが良いでしょう。
default["php"]["ini"]["memory_limit"] = "256M"
# 表示するエラー種別を設定します。
default["php"]["ini"]["error_reporting"] = "E_ALL"
# エラー表示を制御します。（display_errors は実行中に発生したエラー）
default["php"]["ini"]["display_errors"] = "On"
# エラー表示を制御します。（実行前に発生したエラー）
default["php"]["ini"]["display_startup_errors"] = "On"
# エラーログの保存ファイル名を指定します。
default["php"]["ini"]["log_errors"] = "On"
default["php"]["ini"]["error_log"] = "/var/log/php/error.log"
# POST リクエストで送信できるサイズの上限です。
# ファイルアップロードを行う場合はこの値以下までしかアップロード出来ません。
default["php"]["ini"]["post_max_size"] = "8M"
# htmlspecialchars() 等で encoding パラメータを省略した場合この値が使用されます。
# また mbstring.internal_encoding が未設定の場合もこの値が使用されます。
# 更に Content-Type ヘッダにここで指定された値が強制的に設定されます。
# Meta タグが効かなくなってしまうので、UTF-8 以外を利用したい場合は header() で Content-Type を正しく指定する必要があります。
default["php"]["ini"]["default_charset"] = "UTF-8"
default["php"]["ini"]["file_uploads"] = "On"
# アップロード出来るファイルの最大サイズを指定します。
# post_max_size より小さな値でなければいけません。
default["php"]["ini"]["upload_max_filesize"] = "2M"
default["php"]["ini"]["max_file_uploads"] = 20

## [Date]

# タイムゾーン設定が無いと実行時に Warning が発生するので必須設定です。
default["php"]["ini"]["date.timezone"] = "Asia/Tokyo"

## [mail function]

# メールヘッダに X-PHP-Originating-Script が追加されるのを無効にします。
# このヘッダにはファイル名が記述されてしまうためセキュリティ上無効にしたほうが良いでしょう。
default["php"]["ini"]["mail.add_x_header"] = "Off"
# mail() 実行ログを記録するファイルを指定します。
default["php"]["ini"]["mail.log"] = "/var/log/php/mail.log"

## [Session]

# セッションファイルの保存先を設定します。
default["php"]["ini"]["session.save_path"] = "/var/lib/php/session"

## [mbstring]

default["php"]["ini"]["mbstring.language"] = "Japanese"
default["php"]["ini"]["mbstring.detect_order"] = "auto"
