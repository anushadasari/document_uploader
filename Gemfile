source 'https://rubygems.org'

gemspec
ruby '2.2.0'

gem 'rails', '4.2.6'

gem 'mysql2'

gem 'annotate_models'
# for managing file uploads
gem "paperclip", "~> 4.3.6"

# for aws file handling
gem 'aws-sdk', "~> 1.66.0"

group :staging, :production do
  # Use Unicorn as the app server
  gem 'unicorn', '~> 5.1'
end
gem 'thor', "0.19.1"
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'
  gem "rspec"
  gem 'rspec-rails'
  gem "factory_girl"
  gem "factory_girl_rails"
  gem 'rake'
  gem 'faker', '~> 1.6.3'
  gem 'pony'
  gem 'capistrano', '~> 3.5'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'
  gem 'airbrussh', require: false
  gem 'capistrano-bundler', '~> 1.1.4'
  gem 'capistrano-slackify', require: false
  gem 'capistrano-rails'
  gem 'letter_opener'
  gem 'simplecov', :require => false
  gem 'shoulda-matchers', :require => false
  gem 'database_cleaner'
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
