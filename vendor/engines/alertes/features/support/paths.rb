module NavigationHelpers
  module Refinery
    module Alertes
      def path_to(page_name)
        case page_name
        when /the list of alertes/
          admin_alertes_path

         when /the new alerte form/
          new_admin_alerte_path
        else
          nil
        end
      end
    end
  end
end
