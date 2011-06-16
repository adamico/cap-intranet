source 'http://rubygems.org'

gem 'rails', '3.0.9.rc3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml'
gem 'sass'

group :development do
  gem 'sqlite3'
  gem 'haml-rails'
  gem 'pry'
  gem 'pry-doc'
end

group :production do
  gem "pg"
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
#gem 'aws-s3', :require => 'aws/s3'
# european buckets aws-s3
gem 'sauberia-aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================
# Anything you put in here will be overridden when the app gets updated.

gem 'refinerycms',              '= 1.0.0'
gem 'fog'

group :development, :test do
  # To use refinerycms-testing, uncomment it (if it's commented out) and run 'bundle install'
  # Then, run 'rails generate refinerycms_testing' which will copy its support files.
  gem 'refinerycms-testing',    '= 1.0.0'
  gem 'spork', '~> 0.9.0.rc'
end

# END REFINERY CMS ============================================================

# USER DEFINED

# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-inquiries',    '~> 0.9.'
#gem 'refinerycms-news',         '~> 1.0'
# gem 'refinerycms-portfolio',    '~> 0.9.9'
# gem 'refinerycms-theming',      '~> 1.0'
gem 'refinerycms-search',       '~> 0.9.8'
gem 'refinerycms-blog',         '~> 1.5'
gem 'refinerycms-page-images', '~> 1.0'
gem 'refinerycms-memberships',    '~> 1.0', :git => 'https://github.com/rbriank/refinerycms_membership.git'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 1.0.0'

# my custom engines
gem 'refinerycms-alertes', '1.0', :path => 'vendor/engines'
gem 'refinerycms-documents', '1.0', :path => 'vendor/engines'
gem 'refinerycms-events', '1.0', :path => 'vendor/engines'
gem 'refinerycms-enquetes', '1.0', :path => 'vendor/engines'
gem 'refinerycms-colloques', '1.0', :path => 'vendor/engines'
gem 'refinerycms-publications', '1.0', :path => 'vendor/engines'

gem 'kronn-has_many_polymorphs'
gem 'annotate'
gem 'stringex'
# END USER DEFINED
