require 'refinery'

module Refinery
  module Enquetes
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "enquetes"
          plugin.activity = {
            :class => Enquete,
            :title => 'titre'
          }
        end
      end
    end
  end
end
