# README


# Voice Memo App
### メモアプリ

自由にジャンル分けできます。

検索機能を使えば過去の記録がすぐに呼び出せるので備忘録として手軽に使えます。

カレンダー表示機能も付いてるのでスケジュール管理もできます。

Web Speech APIによりChrome環境では音声入力が可能です。

# 作成背景

- 映画やアニメが好きで映画館やレンタルなどたくさん観賞したきましたが、タイトルを覚えていないことが多く、観賞途中で気付くこともありました。  
備忘録として手軽に使え、自由度の高いものがあれば良いなと思い作りました。  


# Sample

[![Image from Gyazo](https://i.gyazo.com/55f01acd3a3d95ca3a6f4e6201c45a2d.gif)](https://gyazo.com/55f01acd3a3d95ca3a6f4e6201c45a2d) 
[![Image from Gyazo](https://i.gyazo.com/ad066160fc2759937871a2910ea70cf5.gif)](https://gyazo.com/ad066160fc2759937871a2910ea70cf5)
[![Image from Gyazo](https://i.gyazo.com/511c54ef013bf8f58fd85e0abc7cf6cd.gif)](https://gyazo.com/511c54ef013bf8f58fd85e0abc7cf6cd)

# 機能

- 音声入力ができる。  
- 記録データが検索できる。  
- カレンダーに表示するかを選択できる。
- 投稿、削除の非同期通信(Ajax)

# 工夫した点

- メモ帳やスケジュール管理など自由度を高くするために、カレンダー表示を選択できるようにした。

# 課題

- viewのデザイン。
- PC以外の端末に対応したレイアウト。
- 音声入力がChromeのみの対応の為、別のAPIの導入。


# 本番環境

https://www.myvoicememo.com/

ゲストログイン機能を実装しております。

~~<テストアカウント>~~   
 ~~- e-mail: memo@gmail.com~~  
~~- password: 12345678~~   

 ※検索機能やカレンダー表示の動作確認にお使いください。　　
  
# 開発環境

- os Mac　Catalina 10.15.6  
- Ruby 2.5.1  
- Ruby on Rails 5.0.7.2  
- MySQL  
- AWS/EC2/unicorn  
- Web Speech API


# 使用方法(ローカル)

```
 $ git clone https://github.com/honshin4n1/voice_memo_app.git
                                              
 $ cd voice_memo_app

 $ bundle install

 $ rails db:create

 $ rails db:migrate
 ```


# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :genres
- has_many :contents

## genresテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- has_many :contents
- belongs_to :user

## contentsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|comment|string||
|start_time|datetime|null: false|
|display|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|genre_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :genre






