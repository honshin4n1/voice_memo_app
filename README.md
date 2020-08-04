# README


# Voice Memo App
### メモアプリ

自由にジャンル分けできます。

検索機能を使えば過去の記録がすぐに呼び出せるので備忘録として手軽に使えます。

カレンダー表示機能も付いてるのでスケジュール管理もできます。

Web Speech APIによりChrome環境では音声入力が可能です。

# Sample

[![Image from Gyazo](https://i.gyazo.com/c729c8758fc627a8fab0c2c4e443b884.gif)](https://gyazo.com/c729c8758fc627a8fab0c2c4e443b884)  

# 機能

- 音声入力ができる。  
- 記録データが検索できる。  
- カレンダーに表示するかを選択できる。


# 本番環境

http://54.249.157.151/

※http通信の為、本番環境ではマイク許可はできません。

<テストアカウント>   
 - e-mail: memo@gmail.com  
 - password: 12345678   
 ※検索機能やカレンダー表示の動作確認にお使いください。　　
  
# 開発環境

- os Mac　Catalina 10.15.6  
- Ruby 2.5.1  
- Ruby on Rails 5.0.7.2  
- MySQL  
- AWS/EC2/unicon  
- Web Speech API


# 使用方法(ローカル)

```
 $ git clone https://github.com/honshin4n1/voice_memo_app.git
                                              
 $ cd voice_memo_app

 $ bundle install

 $ rails db:create

 $ rails db:migrate
 ```
                                               






