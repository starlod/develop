# develop

[開発環境の準備をしておく](https://github.com/starlod/develop/wiki/開発環境構築)

```
git clone https://github.com/starlod/develop

cd develop/chef-repo
vagrant up
vagrant ssh-config --host develop >> ~/.ssh/config
chef exec knife solo prepare develop
chef exec knife solo cook develop
ssh develop
```
