
# codelib2-webdoc

- sinatraによる雑な整理ツールを作っています
- http://codelib.ukibune.net に同様のものがあります

## setup

- `bundle install`

失敗する場合、おそらく必要なアプリケーションがインストールされていない。
- `sudo apt install ruby ruby-dev gem sqlite3 libsqlite3-dev`(ubuntu)

## 実行

- run by sinatra
  - `bundle exec ruby webdoc.rb`
- run by unicorn
  - `bundle exec unicorn -c unicorn.rb -E production -D`

  