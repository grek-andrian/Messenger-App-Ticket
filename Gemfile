source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#Default gems
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#Custom gems
gem 'better_errors', '~> 2.1', '>= 2.1.1'
gem 'pry', '~> 0.10.4'
gem 'devise', '~> 4.2'
gem 'mailboxer', '~> 0.14.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'devise-bootstrap-views'
gem "paperclip", "~> 5.0.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
end


group :test do
  gem 'selenium-webdriver', '~> 2.53'
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'factory_girl', '~> 4.7'
  gem 'rspec-collection_matchers'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
