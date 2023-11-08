#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
# Rails でよくある server.pid のエラーを回避するため、Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /rails_docker_techlog-app/tmp/pids/server.pid

# 追記
if [ $RAILS_ENV = 'production' ]; then
  # bundle exec rails assets:clobber
  bundle exec rails assets:precompile
  # bundle exec rails tailwindcss:build
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# コンテナのプロセスを実行。`exec "$@"`で、Dockerfile 内の`CMD ["rails", "server", "-b", "0.0.0.0"]`を実行。(=`rails s`)
exec "$@"