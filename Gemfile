source 'https://rubygems.org'

gem 'rails', '3.2.8'

# choose your flavor
group :development do
  gem 'mysql2'
end

group :production do
  gem 'pg'
end

# user authentication & authorization
gem 'devise'
gem 'cancan'

# templates
gem 'haml-rails'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'less-rails'

# javascript
gem 'jquery-rails'
gem 'jquery-ui-rails'

# admin
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'
gem 'sass-rails',   '~> 3.2.3'

# CMS
gem 'friendly_id'
gem 'awesome_nested_set'
gem 'globalize3', :git => 'git@github.com:svenfuchs/globalize3.git' # I18n fields
gem 'ActiveAdmin-Globalize3-inputs', :git => 'git://github.com/mimimi/ActiveAdmin-Globalize3-inputs.git'

gem 'RedCloth' # Textile

# auditing / versioning
gem 'paper_trail'

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
  gem 'factory_girl_rails'
  gem 'faker'
end
