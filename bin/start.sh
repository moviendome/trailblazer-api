#!/usr/bin/env bash
bundle check || bundle install --jobs=8 --retry=3
bin/rake db:migrate
foreman start
