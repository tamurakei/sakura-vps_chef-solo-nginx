sakura-vps_chef-solo
====================

For SAKURA Internet VPS Server setup.

このレポジトリはさくらインターネットで利用するVPSのサーバセットアップを簡略化する為のchef-soloを管理する為のものです。
自由に使っていただいても構いませんが、自己責任にてお願いいたします。
Pull Request,Forkなどは歓迎いたします。


サーバにログイン後、以下の１行を実行するだけで、サーバ設定を全て自動で行います。  
サーバ構築後の更新やメンテナンスにはまだ対応しておりません。

## 最初のログイン後に実行する１行だけのコマンドライン
`git clone https://github.com/diverta/sakura-vps_chef-solo.git /usr/local/chef && sh /usr/local/chef/bin/run all`

下記に個別にWordPressのみインストールする場合なども記載がありますので、参照してください。



# インストール・設定されるもの
調整しながら行っておりますので、間違っている点や修正するべき点は遠慮なくご指摘ください。

## SSH
* ポートの変更（対話形式で指定）
* 接続元のIPアドレスの指定（対話形式で指定　設定なしでもOK）

## iptables
* ポートの通信を最低限に設定

## wordpress
* 通常のインストールを行う
* chef-soloでのインストール後、http://[サーバのIPアドレス]/wp-admin/install.phpで初期設定をしてください。
wordpressのみインストールする場合は、
`git clone https://github.com/diverta/sakura-vps_chef-solo.git /usr/local/chef && sh /usr/local/chef/bin/run wordpress`

## powerdns
* PowerAdminもインストールする

powerdnsのみインストールする場合は、
`git clone https://github.com/diverta/sakura-vps_chef-solo.git /usr/local/chef && sh /usr/local/chef/bin/run powerdns`


# 株式会社ディバータについて

[RCMS](http://www.r-cms.jp/)というCMSをSaaS形式で提供している会社です。今後、このSaaS環境をオープン化していくにあたって、Chefなどの技術を勉強しているところです。
現在、ディレクター、エンジニアを絶賛募集中です！ご興味ある方はお気軽に[こちら](mailto:saiyo@diverta.co.jp)までご連絡ください。

