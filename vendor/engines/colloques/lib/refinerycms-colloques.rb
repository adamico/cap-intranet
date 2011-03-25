require 'refinery'

module Refinery
  module Colloques
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "colloques"
          plugin.activity = {
            :class => Colloque}
        end
      end
    end
  end
end
