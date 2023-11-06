#!/bin/sh

if [ "${RAILS_ENV}" = "production" ]
then
    # bundle exec puma -C config/puma.rb
    rails server -b 0.0.0.0 -p 3000
else
    rails server -b 0.0.0.0 -p 3000
fi
