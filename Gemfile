source "https://rubygems.org"

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "redis", ">= 4.0.1"
gem "kredis"
gem "bootsnap", require: false
gem "pagy", "~> 9.0"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0.0"
end

group :development do
  gem "web-console"
end

group :test do
  gem "shoulda-matchers", "~> 6.4.0"
end
