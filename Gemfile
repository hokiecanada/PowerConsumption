source 'http://rubygems.org'

gem 'rails', '3.1.3'
group :development, :test do
	gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :production do
  # gems specifically for Heroku go here
  gem "\'pg'
end

# Skip attempting to install the pg gem
$ bundle install --without production

gem 'jquery-rails'

