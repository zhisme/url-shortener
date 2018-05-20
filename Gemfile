source 'https://rubygems.org'
ruby '2.4.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'mysql2', '~> 0.5.1'
gem 'rails', '~> 5.1.6'
gem 'thin', '~> 1.7.2'

group :development, :test do
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker', '~> 1.8.7'
  gem 'rspec-rails', '~> 3.6'
end

group :test do
  gem 'database_cleaner', '~> 1.6.2'
end

group :pry do
  gem 'awesome_print', '1.8.0'
  gem 'byebug', '9.1.0'
  gem 'pry', '0.11.2'
  gem 'pry-byebug', '3.5.0'
  gem 'pry-doc', '0.11.1'
  gem 'pry-rails', '0.3.6'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'brakeman', '4.0.1', require: false
  gem 'rubocop', '0.53.0', require: false
end
