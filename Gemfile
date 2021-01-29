source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'devise-i18n', '~> 1.9', '>= 1.9.2'
gem 'globalize', '~> 6.0'
gem 'image_processing', '~> 1.2'
gem 'jbuilder', '~> 2.7'
gem 'mailjet', '~> 1.5', '>= 1.5.4'
gem 'passpartu', '~> 1.0', '>= 1.0.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'pundit', '~> 2.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rails_admin_globalize_field', '~> 1.2'
gem 'rails_admin-i18n', '~> 1.16'
gem 'rails-i18n', '~> 6.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rails_admin', '~> 2.0'
gem 'r_creds'
gem 'redis', '~> 4.1.3'
gem 'sidekiq', '~> 6.0.3'
gem 'slim-rails'
gem 'xlog'

group :development, :test do
  gem 'dotenv'
end

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'rubocop'
  gem 'rubycritic'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fakeredis'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'rspec-sidekiq'
  gem 'vcr'
  gem 'webmock'
end
