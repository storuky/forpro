source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

group :development, :test do
  gem "rails-erd"
  gem 'railroady'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'

  gem 'pry'
  gem 'pry-remote'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
  gem 'quiet_assets'
  gem 'rename'
  gem 'bullet'
  gem "awesome_print"
end

gem 'thin'
gem 'active_model_serializers', '>= 0.9.2'

gem 'factory_girl_rails'
gem 'faker'

gem 'pg'
gem 'russian'

gem 'slim'
gem 'slim-rails'
gem 'rmagick'
gem 'devise'
gem 'gon'
gem 'carrierwave'

gem 'mysql2',          '~> 0.3.13', :platform => :ruby
gem 'thinking-sphinx', '~> 3.1.0'

gem 'aasm'

gem 'google_currency'
gem 'mini_magick'

gem "oxymoron", git: "https://github.com/storuky/oxymoron.git", branch: :master

gem 'oj'
gem 'oj_mimic_json'
gem 'whenever', :require => false

gem 'sidekiq'
gem 'devise-async'
gem 'sinatra', :require => nil
gem 'premailer-rails'
gem 'file_validators'
gem "validate_url"
gem "rest-client"

gem "dynamic_sitemaps"

group :test, :development do
  gem 'dotenv-rails'
  gem 'erb2haml'

  gem "webmock",                           require: false
  gem "vcr",                               require: false
  gem 'timecop'

  gem 'rspec-rails'
  gem 'rspec-retry', '~> 0.4.5'

  #gem 'cucumber-rails',                    require: false
  gem 'capybara'#,                          require: false
  gem 'capybara-webkit'#,                   require: false            # default cucumber javascript capybara driver (@javascript tag in cucumber tests)
  gem 'capybara-screenshot'

  gem 'headless'
  gem 'action_mailer_cache_delivery'

  gem 'launchy'                                                         # "show me the page" step in cucumber features

  gem 'database_cleaner'
  gem 'mocha',                             require: false

  gem 'selenium-webdriver'
  gem "chromedriver-helper", "0.0.7"
  gem 'ci_reporter'
  gem 'ci_reporter_rspec'

  gem 'rubocop',                           require: false
  gem 'poltergeist'
end