module NavigationHelpers
  module Refinery
    module Colloques
      def path_to(page_name)
        case page_name
        when /the list of colloques/
          admin_colloques_path

         when /the new colloque form/
          new_admin_colloque_path
        else
          nil
        end
      end
    end
  end
end
