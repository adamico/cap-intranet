require 'refinery'

module Refinery
  module Publications
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "publications"
          plugin.activity = {
            :class => Publication}
        end
      end
    end
  end
end
