gem 'puma'
gem 'mysql2'

gem_group :development, :test do
  gem "rspec-rails"
  gem 'dotenv-rails'
end

gem_group :staging, :production do
  'rails_12factor'
end

run "echo \"\nruby '2.4.3'\n\n\" >> Gemfile"
run "echo \"web: bundle exec puma -C config/puma.rb\nworker: rake jobs:work\"\n > Procfile"

env = %Q{ 
  DEVELOPMENT_HOSTNAME=mysql.website.com
  DEVELOPMENT_DB_NAME=website_development
  DEVELOPMENT_USERNAME=user
  DEVELOPMENT_PASSWORD=pass
  RAILS_ENV=development
  RACK_ENV=development
  SECRET_KEY_BASE=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
}
run "\"#{env}\" > .env"
