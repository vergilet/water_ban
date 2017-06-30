#!/bin/sh
rm -f /rails/tmp/pids/server.pid && bundle exec puma -C config/puma.rb
