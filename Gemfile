source "https://rubygems.org"

# Common gems (used in all environments)
gem "rails", "~> 8.0.0"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", "~> 1.18.4", require: false
gem "solid_cache", "~> 1.0.6"
gem "solid_queue", "~> 1.0.1"
gem "solid_cable", "~> 3.0.2"
gem "thruster", "~> 0.1.9", require: false
gem "devise", "~> 4.9.4"
gem "devise-jwt", "~> 0.12.1"
gem "pundit", "~> 2.4.0"
gem "jsonapi-resources", "~> 0.10.7"
gem "rack-cors", "~> 2.0.2"
gem "sidekiq", "~> 7.3.5"
gem "sidekiq-scheduler", "~> 5.0.6"
gem "money-rails", "~> 1.15.0"
gem "money-open-exchange-rates", "~> 1.4.0"
gem "wicked_pdf", "~> 2.8.2"

group :development do
  gem "kamal", "~> 2.3.0", require: false
  gem "annotaterb"
end

group :development, :test do
  gem "debug", "~> 1.9.2", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", "~> 6.2.2", require: false
  gem "rubocop-rails-omakase", "~> 1.0.0", require: false
  gem "rspec-rails", "~> 7.1.0"
  gem "factory_bot_rails", "~> 6.4.4"
  gem "faker", "~> 3.5.1"
  gem "dotenv-rails",  "~> 3.1.4"
end

group :test do
  # Add test-specific gems here if needed
end
# Uncomment these gems as needed
# gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"
# gem "jbuilder"
