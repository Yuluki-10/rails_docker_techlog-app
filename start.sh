#!/bin/sh

if [ "${RAILS_ENV}" = "production" ]
then
    bundle exec puma -C config/puma.rb # 本番環境（Heroku）では、Puma起動
else
    rails server -b 0.0.0.0 -p 3000 # 開発環境ではrails serverコマンド（と言っても、Rails5以降はPuma起動になる?）
fi
