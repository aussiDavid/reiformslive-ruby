source 'https://rubygems.org'

# Specify your gem's dependencies in reisa-wrapper.gemspec
gemspec

group :development do
  gem 'guard'
  gem 'guard-rspec'   , require: false
  gem 'guard-bundler' , require: false
end

group :test do
  gem 'webmock'  
  gem 'vcr'  
  gem 'byebug'
end

group :development, :test do
  gem 'awesome_print', require: 'ap'
end