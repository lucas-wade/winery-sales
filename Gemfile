source 'https://rubygems.org'

gem 'rails', '~> 5.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sinatra', github: 'sinatra/sinatra'

gem 'rack-protection', github: 'sinatra/rack-protection'

#monitoring
gem "skylight"

#spreadsheets
gem 'roo', '~> 2.1.0'
gem 'roo-xls', '~> 1.0.0'

#email
gem 'mailgun-ruby', '~>1.1.0'

#files
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem "refile", require: "refile/rails", github: 'refile/refile'
gem "refile-mini_magick", github: 'refile/refile-mini_magick'

#style

gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'will_paginate', '~> 3.1.0'
#gem 'bootstrap-will_paginate'
#gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
gem 'font-awesome-rails', '~> 4.5.0', :require => "font-awesome-rails"

#database postgresql
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.1.0'
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5.x'
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password

gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'faker', '1.6.6'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rails-controller-testing'
#  gem 'faker',                '1.4.2'
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
