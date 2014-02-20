ruby '2.0.0'
#ruby-gemset=Bri_B_Que
source 'https://rubygems.org'

gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
# Use jquery as the JavaScript library
gem 'haml'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'
group :production do
  gem 'rails_12factor'
end

group :test, :development do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'letter_opener'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem 'coveralls'
  gem 'email_spec'
  gem 'launchy'
  gem 'poltergeist'
  gem 'webmock'
end