sakura-vps_chef-solo
====================

For SAKURA Internet VPS Server setup.

このレポジトリはさくらインターネットで利用するVPSのサーバセットアップを簡略化する為のchef-soloを管理する為のものです。
自由に使っていただいても構いませんが、自己責任にてお願いいたします。
Pull Request,Forkなどは歓迎いたします。


サーバにログイン後、以下の１行を実行するだけで、サーバ設定を全て自動で行います。  
サーバ構築後の更新やメンテナンスにはまだ対応しておりません。

## 最初のログイン後に実行する１行だけのコマンドライン
`git clone https://github.com/diverta/sakura-vps_chef-solo.git /usr/local/chef && sh /usr/local/chef/bin/first-run`




# インストール・設定されるもの
調整しながら行っておりますので、間違っている点や修正するべき点は遠慮なくご指摘ください。

## SSH
* ポートの変更（対話形式で指定）
* 接続元のIPアドレスの指定（対話形式で指定　設定なしでもOK）

## iptables
* ポートの通信を最低限に設定

## httpd

## php
* php-gd
* php-mbstring



