source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'

# user authentication & authorization
gem 'devise'
gem 'cancan'

# templates
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'less-rails'

# javascript
gem 'jquery-rails'

# admin
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'
gem 'sass-rails',   '~> 3.2.3'

# CMS
gem 'friendly_id'

# gem 'awesome_nested_set'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'quiet_assets'
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'thin'
end

gem 'dotenv', :groups => [:development, :test]

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# To use debugger
# gem 'debugger'

# tests
gem 'rspec-rails', groups: [:test, :development]

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
end
