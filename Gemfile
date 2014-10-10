source 'https://rubygems.org'

gem 'rails', '~> 3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'eventmachine'
gem 'devise'
gem 'tinymce-rails'
gem 'carrierwave'
gem 'cloudinary'
gem 'attachinary'
gem 'letsrate', "1.0.8"
gem 'devise_security_extension'
gem 'rails_email_validator'
gem 'easy_captcha'
gem 'rmagick', "2.13.3", :require => false

group :production do
  gem 'newrelic_rpm'
  gem "pg"
  gem 'rails_12factor'
end

group :development do
  gem 'spork', '~> 0.9.0.rc'
  gem 'pg'
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  gem 'accept_values_for'
  gem 'spork', '~> 0.9.0.rc'
  gem 'rspec-rails'
  gem 'watchr'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
