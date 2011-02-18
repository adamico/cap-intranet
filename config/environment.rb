# Load the rails application
require File.expand_path('../application', __FILE__)

# Sass
Sass::Plugin.add_template_location(
  Rails.root.join('public/stylesheets/sass').to_s,
  Rails.root.join('public/stylesheets').to_s
)

# Initialize the rails application
CapIntranet::Application.initialize!
