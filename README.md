# develop

[開発環境の準備をしておく](https://github.com/starlod/develop/wiki/開発環境構築（Mac）)

## Mac

```
git clone https://github.com/starlod/develop

cd develop/chef-repo
vagrant up
vagrant ssh-config --host develop >> ~/.ssh/config
chef exec knife solo prepare develop
chef exec knife solo cook develop
ssh develop
```

## Windows

```
git clone https://github.com/starlod/develop
vagrant up

cd develop/chef-repo

chef exec knife solo prepare -i "C:\Users\<ユーザディレクトリ>\.vagrant.d\insecure_private_key" -p 2200 vagrant@127.0.0.1
chef exec knife solo prepare vagrant@127.0.0.1 -p 2200 -i "%USERPROFILE%\.vagrant.d\insecure_private_key"
chef exec knife solo cook vagrant@127.0.0.1 -p 2200 -i "%USERPROFILE%\.vagrant.d\insecure_private_key"
```

※Windowsは標準でSSHできないので、[Tera Term](https://ja.osdn.net/projects/ttssh2/releases/)や[putty](http://yebisuya.dip.jp/Software/PuTTY/)などのSSHツールを使用する。
