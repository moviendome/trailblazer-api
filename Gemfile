# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "actioncable", ">= 5.2.3"
gem "actionmailer", ">= 5.2.3"
gem "actionpack", ">= 5.2.3"
gem "activejob", ">= 5.2.3"
gem "activerecord", ">= 5.2.3"
gem "railties", ">= 5.2.3"

gem "pg", "1.1.4"
gem "puma", "4.3.5"
gem "bootsnap", "1.4.4", require: false
gem "rack-cors", "1.0.3", require: "rack/cors"

# trb
gem "trailblazer-rails", "2.1.7"
gem "trailblazer", "2.1.0.rc13"
gem "trailblazer-loader"
gem "dry-types", "0.13.4"
gem "multi_json"
gem "reform", '2.3.0.rc1'
gem "reform-rails", '0.2.0.rc2'
gem "trailblazer-finder", "0.1.4"
gem "virtus", "1.0.5"

gem "dry-validation"

gem "devise-jwt", "0.6.0"

group :development, :test do
  gem "annotate", "2.7.5"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "foreman", ">= 0.85.0"
end

group :test do
  gem "test-unit", "3.3.3"
  gem "shoulda", "3.6.0"
  gem "shoulda-context", "1.2.2"
  gem "shoulda-matchers", "3.1.2"
  gem "minitest-spec-rails", "5.5.0"
  gem "minitest-around", "0.5.0"
  gem "database_cleaner", "1.7.0"
  gem "fabrication", "2.20.2"
  gem "faker", "1.9.6"
end

gem "rubocop", require: false
